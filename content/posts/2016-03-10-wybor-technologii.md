---
title: Wybór technologii
author: Marcin Klimek
type: posts
date: 2016-03-10T22:26:36+00:00
url: /wybor-technologii/
categories:
  - cinder climb
  - dsp
tags:
  - computer vision
  - dsp

---
<a href="https://klimek.link/blog/wp-content/uploads/2016/03/DSP2016-logo-RGB-color-4.png" rel="attachment wp-att-366"><img decoding="async" loading="lazy" class="size-full wp-image-366 alignleft" src="https://klimek.link/blog/wp-content/uploads/2016/03/DSP2016-logo-RGB-color-4.png" alt="DSP2016 logo RGB color-4" width="127" height="288" /></a>

<span style="font-weight: 400;">Zastanawiając się nad tym, czego mógłbym użyć do projektu, od razu do głowy wpadł mi <a href="https://processing.org/" target="_blank">Processing</a></span><span style="font-weight: 400;">. Czytałem sporo o tym oprogramowaniu  i wydaje się bardzo przyjemne do prototypowania. Jest to zintegrowane środowisko(IDE) do nauki i tworzenia oprogramowania w kontekście sztuki video. Do maksimum uproszczono operowanie na grafice. Mnogość dodatkowych bibliotek sugeruje, że warto iść w tym kierunku. Processing używa Javy. Niestety jestem daleki od bycia biegłym w tym języku. Myślę, że na podstawowym poziomie nie ma to najmniejszego znaczenia.</span>

<span style="font-weight: 400;">Sama idea tego typu rozwiązań stała się na tyle ciekawa, że na bazie Processing powstał projekt <a href="http://wiring.org.co/" target="_blank">Wiring</a></span><span style="font-weight: 400;">, upraszczający tworzenie oprogramowania na mikrokontrolery. Szczęśliwie wymieniono Javę na C++. Choć chyba najbardziej znanym projektem, jest <a href="https://www.arduino.cc/" target="_blank">Arduino</a></span><span style="font-weight: 400;">, które bazuje na Wiring. Szybkie stworzenie urządzenia w opartego o mikrokontroler <a href="https://pl.wikipedia.org/wiki/Atmel_AVR" target="_blank">AVR </a>jest banalnie proste.  Zrobiłem kilka urządzeń na Arduino i działają bez problemu od dość dawna. Co prawda oryginalny edytor jest dla mnie średnio wygodny. Przy odrobinie chęci skonfigurowanie <a href="https://www.sublimetext.com/" target="_blank">SublimeText </a>czy nawet <a href="http://www.atmel.com/tools/atmelstudio.aspx" target="_blank">AtmelStudio </a>nie jest problemem, a wygoda pracy znacząco się podnosi.</span>

Skoro mój projekt zawiązany jest w pewnym stopniu z rozszerzoną rzeczywistością, to poniżej przykład co można zrobić w Processing.



&nbsp;

# Przygotowanie do pracy z Processing

<span style="font-weight: 400;">Ze strony</span> [<span style="font-weight: 400;">https://processing.org/download</span>][1] <span style="font-weight: 400;">ściągam paczkę. Aktualnie pracuję pod Windows, więc tym razem będzie to wersja dedykowana pod ten system. </span><span style="font-weight: 400;">Nie zaszkodzi spoglądnąć na <a href="https://github.com/processing/processing/wiki/Changes-in-3.0" target="_blank">release notes</a></span><span style="font-weight: 400;">. Szczególnie, że w paragrafie </span>&#8220;Things That May Break Your 2.x Sketches&#8221;<span style="font-weight: 400;"> </span><span style="font-weight: 400;">widnieje uwaga dotycząca użycia <code class="EnlighterJSRAW" data-enlighter-language="null">size()</code></span>. Miło wiedzieć o takich kwiatkach.

<span style="font-weight: 400;">Wszystkie moje projekty, czy cokolwiek czym się zajmuję, umieszczam w katalogu </span>_<span style="font-weight: 400;">workspace</span>_<span style="font-weight: 400;">. Struktura jest zazwyczaj prosta. W katalogu o nazwie projektu umieszczam wszystkie związane z nim elementy, czyli oprogramowanie/biblioteki(jeśli jest to możliwe), dokumentacje, moje notatki i oczywiście kod źródłowy. Dzięki takiej strukturze, łatwo stworzyć kompletne repozytorium w Git. Tak samo łatwo migrować na inną maszynę. Co prawda pod Windows sprawa nie zawsze jest tak prosta, bo jednak czasem muszę coś instalować i śmiecić katalog </span>_<span style="font-weight: 400;">Program Files</span>_<span style="font-weight: 400;">, niemniej jednak rozwiązanie sprawdza się od lat.</span>

<span style="font-weight: 400;">Czyli tym razem to jest </span>_<span style="font-weight: 400;">c:workspaceCinderClimb </span>_<span style="font-weight: 400;">i tam rozpakowuję archiwum z Processing. Aktualna wersja to 3.0.2</span>

<span style="font-weight: 400;">Po uruchomieniu środowiska, dostępny jest edytor, więc pracę można zacząć od razu.</span>

<a href="https://klimek.link/blog/wp-content/uploads/2016/03/image02.png" rel="attachment wp-att-374"><img decoding="async" loading="lazy" class="size-medium wp-image-374 aligncenter" src="https://klimek.link/blog/wp-content/uploads/2016/03/image02-300x257.png" alt="image02" width="300" height="257" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/image02-300x257.png 300w, https://klimek.link/blog/wp-content/uploads/2016/03/image02.png 700w" sizes="(max-width: 300px) 100vw, 300px" /></a>

<span style="font-weight: 400;">Przy okazji okazało się, ze Processing może też używać Pythona. Programuję w tym języku od wielu lat, to była by kusząca opcja. Jednak zdecydowałem się pozostać przy Javie. Nie chciało mi się szukać informacji na temat dostępnych bibliotek, a skoro jest to raczej nowa cecha środowiska to pewnie słabo z dodatkami. Nie mówię, Python sam z siebie jest ślicznie opakowany bibliotekami, </span>_<span style="font-weight: 400;">&#8220;batteries included&#8221;</span>_<span style="font-weight: 400;">. No, ale…</span>

<span style="font-weight: 400;">Instalacja bibliotek okazuje się banalnie prosta. Wbudowany w edytor </span>_<span style="font-weight: 400;">Contribution Manager</span>_ <span style="font-weight: 400;">listuje wszystko co jest dostępne.</span>

<a href="https://klimek.link/blog/wp-content/uploads/2016/03/image01.png" rel="attachment wp-att-373"><img decoding="async" loading="lazy" class="size-medium wp-image-373 aligncenter" src="https://klimek.link/blog/wp-content/uploads/2016/03/image01-300x273.png" alt="image01" width="300" height="273" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/image01-300x273.png 300w, https://klimek.link/blog/wp-content/uploads/2016/03/image01.png 750w" sizes="(max-width: 300px) 100vw, 300px" /></a>

<span style="font-weight: 400;">Na razie nic nie instaluje, bo muszę się choć minimalnie zaznajomić z się&#8221;architekturą&#8221;. Pocieszające jest to, że środowisko udostępnia jakieś sensowne zarządzanie bibliotekami. Przynajmniej tak to na pierwszy rzut oka wygląda.</span>

Samo skompilowanie pustego projektu działa bez zarzutu i po uruchomieniu pojawia się puste okno. Następny wpis będzie dotyczył wypełnienia pustego projektu pierwszym kodem.

 [1]: https://processing.org/download