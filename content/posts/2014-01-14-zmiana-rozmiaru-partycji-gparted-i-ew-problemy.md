---
title: Zmiana rozmiaru partycji, gparted i ew. problemy
author: Marcin Klimek
type: posts
date: 2014-01-14T11:24:56+00:00
url: /zmiana-rozmiaru-partycji-gparted-i-ew-problemy/
categories:
  - link
format: link

---
Może się zarzyć, że przy próbie zmiany rozmiaru partycji dostaniemy komunikat:

$ parted /dev/sdd unit s print  
Błąd: Nie można mieć partycji poza dyskiem!

W takiej sytuacji należy zmodyfikować lekko TP:

<http://gparted.org/h2-fix-msdos-pt.php#partition-outside-disk>