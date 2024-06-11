---
type: posts
title: Aptana, pyCharm
author: Marcin Klimek
date: 2011-10-28T12:32:47+00:00
url: /aptana-pycharm/
categories:
  - link
format: link
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---

W przypadku Aptany i pyCharm, warto sprawdzić czy używamy przypadkiem nie używamy Open JDK.

Poziom zmulenia tych aplikacji jest niewiarygodny pod Open JDK.

Zmiana na nieco lepiej:

```bash
sudo apt-get update
sudo apt-get install sun-java6-jre sun-java6-plugin sun-java6-fonts
```

zawartość /etc/jvm

```bash
/usr/lib/jvm/java-6-sun
```

zawartość ~.bash_profile

```bash
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export PATH=$PATH:$JAVA_HOME/bin
```