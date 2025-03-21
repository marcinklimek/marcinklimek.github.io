---
title: Troubleshooting GoogleTest Linking Issues in Mixed C++/C# Projects
date: 2025-03-20
created: 2025-03-20T15:23
updated: 2025-03-21T16:12
---

## First Part - Compile the code

Integrating GoogleTest with mixed C++ and managed C++/CLR projects can lead to unique challenges, especially regarding test detection in Visual Studio’s Test Explorer and linker errors. Recently, I faced precisely these issues.

### Diagnosing the Issue

#### Tests Not Appearing in Test Explorer

Initially, my native C++ GoogleTest unit tests were visible in Visual Studio's Test Explorer. However, enabling C++/CLR caused them to disappear. It became clear that Visual Studio’s test adapter struggled to detect GoogleTest tests after incorporating managed code.

#### Linker Errors -  Unexpected Inclusion of Catch2 Library

Simultaneously, I encountered linker errors such as:

```
error LNK2038: mismatch detected for '_ITERATOR_DEBUG_LEVEL': value '0' doesn't match value '2'
error LNK2038: mismatch detected for 'RuntimeLibrary': value 'MD_DynamicRelease' doesn't match value 'MDd_DynamicDebug'
```

These errors occur because Visual Studio tried linking libraries built with conflicting configurations (Debug vs. Release).  Interestingly, even though I hadn't explicitly linked `Catch2`, it was automatically included.  It's vcpkg’s AutoLink feature. It scans and includes relevant libraries based on the configuration. This unexpected automatic linking complicated the whole process.

### Solution

Finally I found out how to resolve these issues. Two additional configuration files were important:

#### 1. **packages.config**

Adding this file explicitly specified the correct `GoogleTest` version and restored test detection in Visual Studio’s Test Explorer:

```xml
<?xml version="1.0" encoding="utf-8"?>
<packages>
  <package id="Microsoft.googletest.v140.windesktop.msvcstl.static.rt-dyn" version="1.8.1.7" targetFramework="native" />
</packages>
```

#### 2. **vcpkg.json**

This file declared dependencies explicitly for vcpkg, ensuring correct linking and resolving conflicts. I'm not sure if it is necessary, but for sure helped in my dev environment.

```json
{
  "name": "my-project",
  "version-string": "0.1.0",
  "dependencies": [
    "gtest"
  ]
}
```

### Conclusion

Looks like, integrating `GoogleTest` into mixed C++/C++/CLR projects can introduce specific problems. Adding additional configuration files - `packages.config` and `vcpkg.json` helps.

## Second Part - The Great `SEH` Exception Mystery

The first part was related to the compilation/linking. Now the runtime.  
Unexpected `SEH` (Structured Exception Handling) exceptions occurring immediately at runtime, preventing even the simplest tests from executing.

> What is the [Structured Exception Handling (SEH)](/posts/structured-exception-handling-seh)

### Initial Checks

My first move was confirming Visual Studio debugger settings were set to Mixed mode (Native + Managed). Next, I used breakpoints to narrow down the problem, eventually pinpointing issues arising when managed code was invoked from my native tests.

The test class has a `SetUp()` method, so I set a breakpoint there. 
```cpp
class UltimateTest : public ::testing::Test
{
protected:
    void SetUp() override
    {
    }
};
```

Nothing broke here. So, I removed all tests and tried adding the simplest test known to everyone:

```cpp
TEST(BasicTest, Test_Simple) {
  EXPECT_EQ(42, 42);
}
```

No problems. I added another test based on my `UltimateTest` fixture:

```cpp
TEST_F(UltimateTest, Test_Simple_Fixture) {
  EXPECT_EQ(42, 42);
}
```

Still no issues, so I moved to the next test, which called into a library written in Managed C++:

```cpp
TEST_F(UltimateTest, Test_Call_Managed) {
    double result = ManagedMethods::Calc(ManagedMethods::CALCULATE_THIS_THING, 1.0);
    EXPECT_NEAR(result, 3.14159, 1e-5);
}
```

It wouldn’t even stop on the first line. The `SEH` exception arrived before the code could even think about running. I was almost sure, the root problem is not the Adapter, libraries but something related to the project itself.

Maybe dynamic libraries weren’t loading properly, or maybe they weren’t loading at all.

### Resolving Assembly Loading Issues

I explicitly handled assembly loading by overriding `SetUp()` in my test fixture:

```cpp
void SetUp() override {
    System::AppDomain::CurrentDomain->AssemblyResolve += gcnew System::ResolveEventHandler(&UltimateTest::OnAssemblyResolve);
    System::Reflection::Assembly::Load("SpecialManagedLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null");
}

static System::Reflection::Assembly^ OnAssemblyResolve(System::Object^ sender, System::ResolveEventArgs^ args) {
    System::String^ assemblyPath = System::IO::Path::Combine(
        System::IO::Path::GetDirectoryName(System::Reflection::Assembly::GetExecutingAssembly()->Location),
        args->Name->Split(',')[0] + ".dll");

    if (System::IO::File::Exists(assemblyPath)) {
        return System::Reflection::Assembly::LoadFrom(assemblyPath);
    } else {
        throw gcnew System::IO::FileNotFoundException("Assembly not found: " + assemblyPath);
    }
}
```

Output logs revealed assemblies loading and immediately unloading, indicating missing dependencies  ( the `"Assembly resolve error:"` message )
Ensuring all dependent libraries were correctly copied to the output directory finally resolved the issue. It took me a while to figure it out. 


## Fiddling with `GoogleTest` Adapters

While chasing this problem, I switched the `GoogleTest` adapter three times:

- `Microsoft.googletest.v140.windesktop.msvcstl.static.rt-dyn.1.8.1.7`
- `Microsoft.googletest.v140.windesktop.msvcstl.dynamic.rt-dyn.1.8.1.7`
- `Microsoft.googletest.v140.windesktop.msvcstl.static.rt-static.1.8.1.7`

I found `static.rt-dyn` was the only one working ok with my project. I was basically grasping at straws, changing everything I could, since I had no clue what was behind the `SEH` chaos.

For a moment, I even considered building my own version of `GoogleTest` with full sources on my machine—so I’d have the debugging comfort of seeing absolutely everything. I ended up pulling down version `1.8.1.7` into a separate directory. That gave me a local reference, at least.

This debugging adventure highlighted how subtle issues—such as mismatched runtime libraries, implicit linking, and missing dependencies—can significantly disrupt mixed-language projects. Explicitly managing configurations and careful handling of assembly loading can mitigate these challenges effectively.