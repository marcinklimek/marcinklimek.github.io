---
title: Processing
author: Marcin Klimek
type: posts
date: 2016-03-17T22:35:09+00:00
url: /processing/
categories:
  - cinder climb
  - dsp
tags:
  - computer vision
  - dsp
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---
# <a href="http://marcinklimek.pl/blog/wp-content/uploads/2016/03/processing-org.jpg" rel="attachment wp-att-372"><img decoding="async" loading="lazy" class="wp-image-500 size-full alignnone" src="https://klimek.link/blog/wp-content/uploads/2016/03/processing-intro.jpg" alt="processing-intro" width="957" height="220" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/processing-intro.jpg 957w, https://klimek.link/blog/wp-content/uploads/2016/03/processing-intro-300x69.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/processing-intro-768x177.jpg 768w" sizes="(max-width: 957px) 100vw, 957px" /></a>

Po zainstalowaniu Processing i ustawieniu wszystkiego zgodnie z moim przyzwyczajeniem, nadszedł czas na pierwsze linie kodu. Aplikacja w processing opiera się przede wszystkim na dwóch funkcjach:

  * <code class="EnlighterJSRAW" data-enlighter-language="null">setup()</code>
  * <code class="EnlighterJSRAW" data-enlighter-language="null">draw()</code>

Funkcja <code class="EnlighterJSRAW" data-enlighter-language="null">setup()</code><span style="line-height: 1.5;"> służy do ustalenia warunków początkowych. Wywoływana jest jednorazowo po uruchomieniu aplikacji. </span>Umieszcza się tam wszystko to co potrzebujemy i możemy zainicjować, załadować, zanim nasz program zacznie działać na dobre.

<pre class="EnlighterJSRAW" data-enlighter-language="null">void setup()
{
    size(960, 540);
}</pre>

Użycie funkcji <code class="EnlighterJSRAW" data-enlighter-language="null">size()</code> w <code class="EnlighterJSRAW" data-enlighter-language="null">setup()</code><span style="line-height: 1.5;">pozwala ustawić początkowy rozmiar okna. Po uruchomieniu takiej aplikacji, mamy spektakularny efekt w postaci pustego okna.</span>

Funkcja <code class="EnlighterJSRAW" data-enlighter-language="null">draw()</code> wywoływana jest cyklicznie, aż do zamknięcia aplikacji. Jest to połowiczna prawda, bo można zablokować wywoływanie tej funkcji, ale nie ma to teraz żadnego znaczenia. Domyślna częstotliwość dla <code class="EnlighterJSRAW" data-enlighter-language="null">draw()</code> to 60Hz. Zmianę można wywołać poprzez funkcje <code class="EnlighterJSRAW" data-enlighter-language="null">frameRate()</code>.  Po uruchomieniu aplikacji zobaczymy takie okno  
<img decoding="async" loading="lazy" class="size-medium wp-image-384 aligncenter" src="http://marcinklimek.pl/blog/wp-content/uploads/2012/04/processing-emptywindow-2-300x177.png" alt="processing-emptywindow" width="300" height="177" />  
Mój projekt ma bazować na przetwarzaniu obrazu z kamery, więc należałoby dodać jej obsługę. Potrzebny do tego jest moduł Video. W przypadku Processing bazuje on na znanej bibliotece <a href="https://gstreamer.freedesktop.org/" target="_blank">GStreamer</a>. Instalacja poprzez &#8220;Contributon Manager&#8221; znacząco upraszcza sprawę.

Na początek planuję używać tego co mam pod ręką, czyli kamerę wbudowaną w laptopa.  Nie jest zbyt spektakularna jeśli chodzi o parametry, 30 klatek w rozdzielczości 1280&#215;720 będzie wystarczające. Sądzę, że nawet nieco mniej będzie wygodniejsze. Mniej danych, szybciej się policzy. Skoro kamera nie pracuje szybciej niż 30Hz to częstotliwość dla funkcji draw() ustawię też na 30. Czyli będzie to wyglądało następująco:

&nbsp;

<pre class="EnlighterJSRAW" data-enlighter-language="null">import processing.video.*;

Capture video;

void setup()
{
    size(960, 540);
    frameRate(30);
    
    video = new Capture(this, width, height);
    video.start();   // uruchomienie kamery
}</pre>

Zmienne systemowe &#8211; <code class="EnlighterJSRAW" data-enlighter-language="null">width</code>, <code class="EnlighterJSRAW" data-enlighter-language="null">height </code>zawierają odpowiednio szerokość i wysokość okna aplikacji. Zmienna globalna video zawiera obiekt kontrolujący obsługę kamery. Za wyświetlenie obrazu z kamery w oknie odpowiedzialna będzie funkcja draw():

<pre class="EnlighterJSRAW" data-enlighter-language="null">void draw()
{
    if ( video.available() )  //dostępna klatka z kamery
        video.read();         //odczyt klatki
    image(video, 0, 0);
}
</pre>

Konstrukcja aplikacji z podziałem na setup() i draw() jest mniej przejrzysta. Według mnie przydało by się wprowadzić jeszcze wyraźnie zaznaczony update(). Czyli kod, który aktualizuje stan naszej aplikacji, ale nie generuje obrazu. W taki sposób nieco bardziej będzie to przypominało standardową pętlę zdarzeń z silnika gier.

<pre class="EnlighterJSRAW" data-enlighter-language="null">void update()
{
    if ( video.available() )  //dostępna klatka z kamery
        video.read();         //odczyt klatki
}

void draw()
{
    update();

    image(video, 0, 0);
}</pre>

Uruchomienie tego kodu wyświetli okno z obrazem z kamery. Niewiele kodu, a już coś działa.

&nbsp;

<div id="attachment_382" class="wp-caption aligncenter" style="width: 965px">
  <img decoding="async" loading="lazy" class="wp-image-382 size-full" title="Obraz z kamery" src="https://klimek.link/blog/wp-content/uploads/2016/03/processing-camwindow.jpg" alt="processing-camwindow" width="965" height="570" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/processing-camwindow.jpg 965w, https://klimek.link/blog/wp-content/uploads/2016/03/processing-camwindow-300x177.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/processing-camwindow-768x454.jpg 768w" sizes="(max-width: 965px) 100vw, 965px" />
  
  <p class="wp-caption-text">
    Pracuję często z domu i niestety mam tą wątpliwą przyjemność służyć za łoże dla jednego z kotów. Dla dodania uroku tej sytuacji, nadmienię, że mam całkiem sporą alergię na sierść kota. Na screenie wyświetlany obraz z kamery w oknie.
  </p>
</div>

Funkcja _image()_  rysuje w oknie zadany obraz. Definiujemy górny lewy róg, oraz opcjonalnie szerokość i wysokość. Według dokumentacji nie należy do najszybszych. Może m.in. skalować wyświetlany obraz. Wersja bardziej bezpośrednia, to użycie _set()_.

<pre class="EnlighterJSRAW" data-enlighter-language="null">void draw()
{
    update();
    set(0, 0, video);
}</pre>

Wracając do meritum, niespecjalnie spektakularny efekt, ale do przodu. Kolejny etap to obróbka obrazu. Nie mam w planie pisać wszystkiego od nowa. Znacznie mądrzejsi ode mnie stworzyli zacną bibliotekę [OpenCV][1] i z niej zamierzam niedługo skorzystać.

 [1]: http://opencv.org/