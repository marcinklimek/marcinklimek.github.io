---
title: Cinder climb
author: Marcin Klimek
type: posts
date: 2016-03-06T01:57:17+00:00
url: /cinder-climb/
categories:
  - cinder climb
  - dsp
tags:
  - computer vision
  - dsp

---
### <a href="http://dajsiepoznac.pl" target="_blank" rel="attachment wp-att-363"><img decoding="async" loading="lazy" class="alignnone size-medium wp-image-363" src="https://klimek.link/blog/wp-content/uploads/2016/03/DSP2016-logo-RGB-color-1-300x70.png" alt="DSP2016 logo RGB color-1" width="300" height="70" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/DSP2016-logo-RGB-color-1-300x70.png 300w, https://klimek.link/blog/wp-content/uploads/2016/03/DSP2016-logo-RGB-color-1.png 608w" sizes="(max-width: 300px) 100vw, 300px" /></a>

### Cinder Climb

Od mniej więcej roku wspinam się i na ścianie staram się być co najmniej 2 razy w tygodniu. Niesamowicie wciągające zajęcie. Niedawno znajomy umieścił na FB link do bardzo ciekawego połączenia wspinania z komputerem. Gra zręcznościowa rozgrywana bezpośrednio na ścianie.



Nie szukając za wiele informacji na sieci, postanowiłem napisać coś podobnego. Dodatkowo pojawił się na stronie Macieja Aniserowcza konkurs [„Daj się poznać”][1]. Niemal idealnie dopasowany do tego typu projektu. Przez 3 miesiące będę publikował informacje o postępie prac nad moim rozwiązaniem, a kod od będzie na [githubie][2]. Kilka lat temu zajmowałem się programowaniem gier, więc będzie to miłe przypomnienie sobie starych klimatów.

### Bardzo wstępne założenia projektu

Gra polega na łapaniu kolejnych punktów, wyświetlanych na ścianie wspinaczkowej, na czas. Punkty wyświetlane są  za pomocą rzutnika. Detekcja czy gracz dotknął punktu realizowana jest na podstawie obrazu z kamery.

Wstępnie użyję środowiska Processing. Co prawda Java nie jest moją mocną stroną, ale na wykonanie samego proof-of-concept  może być w porządku. Jeśli to rozwiązanie nie będzie mi odpowiadać, to użyję libCinder albo openFrameworks. W tym wypadku będzie to już C++.

Na tym niezmiernie poglądowym rysunku, okolice mojego szczytu możliwości rysowniczych, przedstawiam teoretyczny układ planowanego użycia sprzętu.

<a href="https://klimek.link/blog/wp-content/uploads/2016/03/proto.png" rel="attachment wp-att-358"><img decoding="async" loading="lazy" class="wp-image-358 aligncenter" src="https://klimek.link/blog/wp-content/uploads/2016/03/proto-300x167.png" alt="" width="463" height="258" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/proto-300x167.png 300w, https://klimek.link/blog/wp-content/uploads/2016/03/proto-768x427.png 768w, https://klimek.link/blog/wp-content/uploads/2016/03/proto-1024x569.png 1024w, https://klimek.link/blog/wp-content/uploads/2016/03/proto-1200x667.png 1200w, https://klimek.link/blog/wp-content/uploads/2016/03/proto.png 1288w" sizes="(max-width: 463px) 100vw, 463px" /></a>

Rzutnik rzuca na ścianę wszelkie potrzebne informacje. Kamera umieszczona obok rzutnika, analizuje co się dzieje i czy wspinacz daje radę. Oczywiście wszystko spięte z komputerem.

Następny wpis będzie już konkretniej o wyborze technologii.

&nbsp;

 [1]: http://www.maciejaniserowicz.com/daj-sie-poznac/
 [2]: https://github.com/marcinklimek/CinderClimb