---
title: Elixir pod pypy
author: Marcin Klimek
type: posts
date: 2012-04-18T14:10:31+00:00
url: /elixir-pod-pypy/
categories:
  - takie tam
format: link
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---
&nbsp;

  1. apt-get install libpq-dev
  2. pypy/bin/pip install psycopg2ct
  3. map CT version:

<pre class="literal-block" style="font-size: 14px; background-color: #e0e0ff; margin-left: 2em; margin-right: 2em; line-height: 17px; padding: 10px;">from psycopg2ct import compat
compat.register()</pre>

&nbsp;

&nbsp;