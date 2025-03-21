---
title: The Catch2 adapter for Visual Studio
date: 2025-02-26
created: 2025-02-26T18:25
updated: 2025-03-21T16:24
---
# The Goal

Reveal the tests written using the Catch2 framework in the `Test Explorer` inside the Visual Studio 2022

# Catch2

A modern, C++-native, test framework for unit-tests, TDD and BDD - [GitHub - catchorg/Catch2)](https://github.com/catchorg/Catch2)


# Test Adapter for Catch2

Within Visual Studio, the Test Explorer is a convenient way to run and debug unit tests. This test adapter adds support for the [Catch2 C++ test framework](https://github.com/catchorg/Catch2) (version 2.x and 3.x). This adapter is for use in combination with Visual Studio 2017 and later.

## How to get it

The **Test Adapter for Catch2** is available via the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=JohnnyHendriks.ext01). It is available under the name "Catch Adapter for Catch2". The easiest way to get it is via "Extensions and Updates..." in the "Tools" menu. Of course you can also [build it yourself](Docs/Build.md).

## A note on usage

 Out of the box the extension does not discover tests. You need to add settings for the **Test Adapter for Catch2** to a `.runsettings` file and use that as your test settings. This prevents the discovery mechanism from running non-Catch2 executables in your solution upon first use. See the [Walkthrough](Docs/Walkthrough-vs2022.md) for a detailed description on how to use the **Test Adapter for Catch2**.

## Remark

###  `RunSettings` vs. `TestSettings`

- **`RunSettings`** (`.runsettings`):
    - The **modern format** for configuring test execution (used for MSTest v2, Catch2, xUnit, etc.).
    - Fully XML-based and extensible.
        
- **`TestSettings`** (`.testsettings`):
    - **Legacy format** for MSTest v1.
    - Deprecated in favor of `.runsettings`.
    - Uses a different XML schema and is not compatible with `.runsettings`.

# Walkthrough

1. Have a tests written with Catch2, like `TestMyProcess.cpp`
2. Install  Test Adapter for Catch2 - [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=JohnnyHendriks.ext01).
3. Prepare if it do not exists - `SolutionWideTests.runsettings` - this is just an example file name, but of course can be used.  
   
   Here is good enough sample content:
    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <RunSettings>
    
      <!-- Catch2 adapter -->
      <Catch2Adapter>
        <FilenameFilter>.*[Tt]est.*$</FilenameFilter>
        
        <Logging>debug</Logging>
        <DebugBreak>on</DebugBreak>
        
        <WorkingDirectoryRoot>Solution</WorkingDirectoryRoot>
      </Catch2Adapter>
    
    
      <!-- MSTest Adapter -->
      <MSTest>
        <DeployEnabled>false</DeployEnabled>
        <AssemblyResolution>
          <Directory useLoadContext="true" />
        </AssemblyResolution>
      </MSTest>
    
    </RunSettings>
    ```
          
4. Check if the `.runsettings` file is selected in Visual Studio::
    - Go to **Test** → **Configure Run Settings** → **Select Solution Wide runsettings File**
    - Choose your modified `Solution.runsettings` file.
      ![[Pasted image 20250226184606.png]]
5. Build project - this is the moment when the Adapter will discover the Catch2 Tests
6. Look at the Output Console, select from the dropdown Tests
    ![[Pasted image 20250226184828.png]]
    There should be lines starting with C2A-?????  - and all information related to the discovered Tests. See below:
    ```
    2A-42704: Started Catch2Adapter exe test discovery...
    C2A-42704: Discover log:
    ValidateSourceName name: TestMyProcess
    Source: C:\workspace\0.0_rigaku\RigakuBasicLibs\Bin\x64\Debug\TestMyProcess.exe
      XML Discovery:
    <?xml version="1.0" encoding="UTF-8"?>
    <MatchingTests>
      <TestCase>
        <Name>SAXS 1DViewer capabilites</Name>
        <ClassName/>
        <Tags>[oneDviewer_saxs]</Tags>
     .
     .
     .
     </MatchingTests>
      Testcase count: 4
      Accumulated Testcase count: 4
    
    C2A-42704: Start adding test cases to discovery sink
    C2A-42704:   SAXS 1DViewer capabilites
    C2A-42704:   SAXS slit correction test 2.0
    C2A-42704:   Particle-Pore size analysis modelling 2.0
    C2A-42704:   Pore size analysis modelling
    C2A-42704: Finished adding test cases to discovery sink
    C2A-42704: Finished Catch2Adapter exe test discovery.
    ```

7. In the Test Explorer you should see new Tests like:
    ![[Pasted image 20250226185456.png]]
    



