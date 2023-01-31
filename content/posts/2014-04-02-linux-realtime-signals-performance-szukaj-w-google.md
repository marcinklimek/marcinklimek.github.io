---
title: linux realtime signals
author: Marcin Klimek
type: posts
date: 2014-04-02T06:22:30+00:00
url: /linux-realtime-signals-performance-szukaj-w-google/
categories:
  - link
format: link

---
<p style="color: #000000;">
  <a title="Stackoverflow:" href="http://http://stackoverflow.com/questions/6345973/who-uses-posix-realtime-signals-and-why" target="_blank">From stackoverflow</a>
</p>

<p style="color: #000000;">
  The whole purpose of realtime signals in POSIX is as a realtime delivery mechanism for AIO, message queue notifications, timer expirations, and application-defined signals (both internal and inter-process).
</p>

<p style="color: #000000;">
  With that said, signals in general are a really bad way to do things:
</p>

<ul style="color: #000000;">
  <li>
    Signal handlers are asynchronous, and unless you ensure they do not interrupt an async-signal-unsafe function, they can only use async-signal-safe functions, which really cripples what they can do.
  </li>
  <li>
    Signal handlers are global state. A library cannot use signals without a contract with the calling program regarding which signals it&#8217;s allowed to use, whether it&#8217;s allowed to make them syscall-interrupting, etc. And in general, global state is just <em>A Bad Thing</em>.
  </li>
  <li>
    If you use <code>sigwait</code> (or Linux <code>signalfd</code> extension) rather than signal handlers to process signals, they&#8217;re no better than other IPC/notification mechanisms, and still potentially worse.
  </li>
</ul>

<p style="color: #000000;">
  Asynchronous IO is much better accomplished by ignoring the ill-designed POSIX AIO API and just creating a thread to perform normal blocking IO and call <code>pthread_cond_signal</code> or <code>sem_post</code> when the operation finishes. Or, if you can afford a little bit of performance cost, you can even forward the just-read data back to yourself over a pipe or socketpair, and have the main thread process asynchronously-read regular files with <code>select</code> or <code>poll</code> just like you would sockets/pipes/ttys.
</p>