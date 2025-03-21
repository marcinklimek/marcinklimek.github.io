---
title: Structured Exception Handling (SEH)
date: 2025-03-19
tags:
  - clippings
updated: 2025-03-21T16:19
created: 2025-03-19T13:22
---
Structured Exception Handling (SEH) is a Microsoft-specific extension to C and C++ designed to handle exceptional code situations, particularly hardware faults, in Windows operating systems[1](https://learn.microsoft.com/en-us/cpp/cpp/structured-exception-handling-c-cpp?view=msvc-170)[4](https://stackoverflow.com/questions/2782915/what-should-i-know-about-structured-exceptions-seh-in-c). It serves as a generalized error handling mechanism supported by the Windows OS and is part of the Windows Application Binary Interface (ABI)[3](https://limbioliong.wordpress.com/2022/01/09/understanding-windows-structured-exception-handling-part-1/).

Key features of SEH include:

1. Hardware fault handling: SEH can catch CPU exceptions such as access violations, illegal instructions, and divide-by-zero errors[4](https://stackoverflow.com/questions/2782915/what-should-i-know-about-structured-exceptions-seh-in-c).
2. OS-level mechanism: Unlike C++ exception handling, SEH is an operating system feature not tied to any specific programming language[3](https://limbioliong.wordpress.com/2022/01/09/understanding-windows-structured-exception-handling-part-1/).
3. Per-thread basis: SEH works on a per-thread basis, with each thread containing its own Structured Exception Handling mechanism[3](https://limbioliong.wordpress.com/2022/01/09/understanding-windows-structured-exception-handling-part-1/).
4. Untyped exceptions: SEH exceptions are not typed but share a common data structure containing an exception code and additional information about the fault[4](https://stackoverflow.com/questions/2782915/what-should-i-know-about-structured-exceptions-seh-in-c).
5. First-chance handling: SEH allows for logging or handling exceptions before stack unwinding destroys local variables[4](https://stackoverflow.com/questions/2782915/what-should-i-know-about-structured-exceptions-seh-in-c).
6. Finally mechanism: SEH includes a "finally" mechanism not present in standard C++ exceptions[5](https://en.wikipedia.org/wiki/Microsoft-specific_exception_handling_mechanisms).

While SEH is supported by Windows and Microsoft C++, it is generally recommended to use ISO-standard C++ exception handling for better portability and flexibility[1](https://learn.microsoft.com/en-us/cpp/cpp/structured-exception-handling-c-cpp?view=msvc-170). However, SEH may still be necessary for maintaining existing code or for specific types of programs that require low-level exception handling capabilities[1](https://learn.microsoft.com/en-us/cpp/cpp/structured-exception-handling-c-cpp?view=msvc-170)[4](https://stackoverflow.com/questions/2782915/what-should-i-know-about-structured-exceptions-seh-in-c).