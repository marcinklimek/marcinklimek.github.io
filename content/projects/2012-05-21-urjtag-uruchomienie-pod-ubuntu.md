---
title: urJTAG – uruchomienie pod ubuntu
author: Marcin Klimek
type: posts
date: 2012-05-21T11:26:15+00:00
url: /urjtag-uruchomienie-pod-ubuntu/
categories:
  - link
format: link
created: 2023-11-18T19:04
updated: 2024-06-11T15:31
draft: false
---
Podłączenie do interfejsu jtag przy uzyciu BF30

ubuntu:

wget http://sourceforge.net/projects/urjtag/files/latest/download?source=files

tar xzfv

apt-get install libftdi-dev

configure &#8211;with-libftdi

make

w katalogu src znajdzie się wybudowana wersja

&nbsp;

podłączenie się do interfejsu

jtag>cable OOCDLink-s vid=0x403 pid=0x6010

jtag> detect      /\* przykład dla ALI w GM \*/

jtag> detect  
IR length: 5  
Chain length: 1  
Device Id: 11111111111111111111111111111111 (0x00000000FFFFFFFF)  
Cannot open /usr/local/share/urjtag/MANUFACTURERS  
Unknown manufacturer!  
chain.c(149) Part 0 without active instruction  
chain.c(200) Part 0 without active instruction  
chain.c(149) Part 0 without active instruction

W rzeczywistości to jest MIPS i reszta standardowo

&nbsp;

&nbsp;

&nbsp;

&nbsp;