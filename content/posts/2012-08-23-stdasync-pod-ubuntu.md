---
title: std::async pod ubuntu
author: Marcin Klimek
type: posts
date: 2012-08-23T10:07:29+00:00
url: /stdasync-pod-ubuntu/
categories:
  - link
format: link
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---
<p class="brush:cpp">
  <span style="color: #000000;">Prosty test, który działa niepoprawnie pod ubuntu.</span>
</p>

<p class="brush:cpp">
  <span style="color: #000000;">gcc version 4.5.2 (Ubuntu/Linaro 4.5.2-8ubuntu4) </span>
</p>

<pre class="brush:cpp">#include &lt;future&gt;
#include &lt;iostream&gt;

int foo()
{
    sleep( 5 );
    return 42;
}

int main()
{
    std::future&lt;int&gt; result = std::async(std::launch::async, foo );
    std::cout &lt;&lt; result.get() &lt;&lt; std::endl;

    std::cin.get();

    return 0;
}</pre>

<pre class="brush:cpp"></pre>

<p class="brush:cpp">
  Wykonanie kończy się przez core dump. Pod gdb na razie widać tyle:
</p>

<pre class="brush:cpp">GNU gdb (Ubuntu/Linaro 7.2-1ubuntu11) 7.2

(gdb) start
Temporary breakpoint 1 at 0x41baad
Starting program: /home/makhzi/Pulpit/workspace/@szkolenia/async-test/async-test 

Temporary breakpoint 1, 0x000000000041baad in main ()
(gdb) s
Single stepping until exit from function main,
which has no line number information.
terminate called after throwing an instance of 'std::system_error'
  what():  

Program received signal SIGABRT, Aborted.
0x00007ffff72d9d05 in raise (sig=6)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
64	../nptl/sysdeps/unix/sysv/linux/raise.c: Nie ma takiego pliku ani katalogu.
	in ../nptl/sysdeps/unix/sysv/linux/raise.c

(gdb) info stack
#0  0x00007ffff72d9d05 in raise (sig=6)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
#1  0x00007ffff72ddab6 in abort () at abort.c:92
#2  0x00007ffff7b916dd in __gnu_cxx::__verbose_terminate_handler() ()
   from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#3  0x00007ffff7b8f926 in ?? () from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#4  0x00007ffff7b8f953 in std::terminate() ()
   from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#5  0x00007ffff7b8fa5e in __cxa_throw ()
   from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#6  0x00007ffff7b3a77a in std::__throw_system_error(int) ()
   from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
#7  0x000000000041c6d1 in void std::call_once&lt;std::_Mem_fn&lt;void (std::__future_base::_State::*)(std::function&lt;std::unique_ptr&lt;std::__future_base::_Result_base, std::__future_base::_Result_base::_Deleter&gt; ()()&gt;&, bool&)&gt;, std::__future_base::_State* const, std::reference_wrapper&lt;std::function&lt;std::unique_ptr&lt;std::__future_base::_Result_base, std::__future_base::_Result_base::_Deleter&gt; ()()&gt; &gt;, std::reference_wrapper&lt;bool&gt; &gt;(std::once_flag&, std::_Mem_fn&lt;void (std::__future_base::_State::*)(std::function&lt;std::unique_ptr&lt;std::__future_base::_Result_base, std::__future_base::_Result_base::_Deleter&gt; ()()&gt;&, bool&)&gt;, std::__future_base::_State* const&&, std::reference_wrapper&lt;std::function&lt;std::unique_ptr&lt;std::__futu---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---info stack
re_base::_Result_base, std::__future_base::_Result_base::_Deleter&gt; ()()&gt; &gt;&&, std::reference_wrapper&lt;bool&gt;&&) ()
#8  0x000000000041c16e in std::__future_base::_State::_M_set_result(std::function&lt;std::unique_ptr&lt;std::__future_base::_Result_base, std::__future_base::_Result_base::_Deleter&gt; ()()&gt;, bool) ()
#9  0x0000000000421fc2 in std::__future_base::_Deferred_state&lt;int&gt;::_M_run_deferred() ()
#10 0x000000000041c006 in std::__future_base::_State::wait() ()
#11 0x000000000041d20f in std::__basic_future&lt;int&gt;::_M_get_result() ()
#12 0x000000000041c8dc in std::future&lt;int&gt;::get() ()
#13 0x000000000041bacf in main ()</pre>

<p class="brush:cpp">