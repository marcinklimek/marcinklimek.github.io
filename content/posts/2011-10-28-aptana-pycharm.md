---
type: 
title: Aptana, pyCharm
author: Marcin Klimek
date: 2011-10-28T12:32:47+00:00
url: /aptana-pycharm/
categories:
  - link
format: link
type: postss
---

W przypadku Aptany i pyCharm, warto sprawdzić czy używamy przypadkiem nie używamy Open JDK.

Poziom zmulenia tych aplikacji jest niewiarygodny pod Open JDK.

Zmiana na nieco lepiej:

<pre class="brush:shell">sudo add-apt-repository ppa:ferramroberto/java
sudo apt-get update
sudo apt-get install sun-java6-jre sun-java6-plugin sun-java6-fonts</pre>

zawartość /etc/jvm

<pre class="brush:applescript">/usr/lib/jvm/java-6-sun</pre>

zawartość ~.bash_profile

<pre class="brush:applescript">export JAVA_HOME=/usr/lib/jvm/java-6-sun
export PATH=$PATH:$JAVA_HOME/bin</pre>