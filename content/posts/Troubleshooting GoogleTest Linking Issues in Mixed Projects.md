---
title: Troubleshooting GoogleTest Linking Issues in Mixed C++/C# Projects
date: 2025-03-20
created: 2025-03-20T15:23
updated: 2025-03-20T15:59
---
## Troubleshooting GoogleTest Linking Issues in Mixed C++/C# Projects

While working on a project that combines native C++ components with managed code (C++/CLR), I encountered an unusual challenge integrating GoogleTest with **Test Explorer** in Visual Studio. By default, Visual Studio installs a test adapter that detects GoogleTest-based tests, but adding managed code caused the tests to disappear and led to linker errors that prevented the project from building correctly.

### Diagnosing the Problem

#### Tests Not Being Detected

In a purely native C++ project, tests were correctly visible in Test Explorer. However, after enabling managed code (C++/CLR), Visual Studio stopped recognizing GoogleTest tests. This was likely due to interference with the test adapter, which couldn't locate the tests after the project configuration changed.

#### Linker Errors

Compilation resulted in linker errors such as:

```
error LNK2038: mismatch detected for '_ITERATOR_DEBUG_LEVEL': value '0' doesn't match value '2'
error LNK2038: mismatch detected for 'RuntimeLibrary': value 'MD_DynamicRelease' doesn't match value 'MDd_DynamicDebug'
```

These errors were caused by mixing libraries compiled with different configurations (Debug vs. Release). As a result, the project attempted to link modules with incompatible settings, leading to inconsistencies in flags such as `_ITERATOR_DEBUG_LEVEL` and different Runtime Library settings.

#### Unexpected Linking of Catch2 Library

Interestingly, there was no need to manually link the Catch2 library. The vcpkg dependency manager, when using the _Use AutoLink_ option, automatically detected and added the necessary linker entries. Intermediate logs (e.g., link*.tlog files) revealed that **Catch2.lib** was unexpectedly included in the linking process.

### Solution

The key to resolving the issue was adding two additional configuration files to the project:

1. **`packages.config` File**
    
    Adding a `packages.config` file enforced the use of the correct version of GoogleTest. Placed in the test directory, the file contained the following configuration:
    
    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <packages>
      <package id="Microsoft.googletest.v140.windesktop.msvcstl.static.rt-dyn" version="1.8.1.7" targetFramework="native" />
    </packages>
    ```
    
    This configuration allowed the test adapter to correctly detect tests, making them appear in Test Explorer.
    
2. **`vcpkg.json` File**
    
    To properly integrate with the vcpkg package manager, adding a `vcpkg.json` file was necessary to declare a dependency on GoogleTest. The file contained the following content:
    
    ```json
    {
      "name": "my-project",
      "version-string": "0.1.0",
      "dependencies": [
        "gtest"
      ]
    }
    ```
    
    By enabling the _Use AutoLink_ option in vcpkg and adding this file, the linker could to automatically detect and configure the appropriate libraries, resolving the linker errors.
    

### Conclusion

Integrating GoogleTest into mixed C++/C++/CLR projects can introduce specific challenges due to compilation configuration mismatches and disruptions in Visual Studio’s test adapter. Implementing additional configuration files such as `packages.config` and `vcpkg.json` ensures version consistency and allows correct test detection in Test Explorer.