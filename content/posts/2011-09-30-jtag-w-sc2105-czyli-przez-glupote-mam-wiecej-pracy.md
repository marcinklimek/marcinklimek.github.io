---
title: JTAG w SC2105, czyli przez głupotę mam więcej pracy
author: Marcin Klimek
type: posts
date: 2011-09-29T22:02:13+00:00
url: /jtag-w-sc2105-czyli-przez-glupote-mam-wiecej-pracy/
categories:
  - takie tam

---
Od pewnego czasu męczę się z pewnym urządzeniem i aktualnie moim problemem jest przejęcie kontroli nad procesorem. Teoretycznie można powiedzieć, że jtag załatwi sprawę. Problem jednak w tym, że urządzenie które próbuję przywrócić do życia jest wyjątkowo niepopularne. Nie dość, że brak dokumentacji serwisowej do samego urządzenia to znalezienie czegoś więcej o procesorze, niż ulotka, graniczy z cudem. Procesor to LSI Logic SC2105. Na razie wiem, że to SoC i ma w sobie rdzeń MIPS, więc jak dobiję się do jtaga, to wiem jak ustawić rejestry, żeby dało się go kontrolować. Na płycie głównej mam sporo różnych pinow, po testach chyba znalazłem te odpowiedzialne za JTAG. I teraz zaczyna się zabawa.

Do mieszania za pomocą tego interfejsu używam trzech narzędzi:

  * OpenOCD
  * urJTAG
  * ftjref

Konwerter USBJTAG to Bof30 (oparty o FT2232, pracujący jako oocdlink)

Jak znalazłem złącze JTAG:

Sprzęt który analizuję to Harmonic PVR 6000, czyli tak na prawdę Scopus serii IRD-2900 z procesorem SC2105. Procesor ten to rozbudowana o AC3 i coś jeszcze wersja SC2005. To nieco poszerzyło możliwości znalezienia informacji.

Odnalazłem na sieci schemat serwisowy urządzenia opartego o SC2005 z opisem pinów jtaga. Problem, że to obudowa to BGA, płytka wielowarstwowa. Szczęśliwie było kilka przelotek i jedna z nich to potencjalny sygnał TCLK. Masa jest oczywista, zasilanie także. Pozostają jeszcze: TDI, TDO, TMS, TRST. Z pomocą przyszedł internet. Na jednym forum odnalazłem dyskusję o podłączeniu jtaga do procesora SC2000. Na sieci krążą noty techniczne o zmianach między generacjami procesorów i jeśli chodzi o piny, to zmiany były kosmetyczne i nie dotyczyły jtaga. Złącze &#8220;serwisowe&#8221; to IDC16 i układ pinów był niemal identyczny. Różnica dotyczyła tylko dodatkowego zasilania. Czyli miałem coś o co można się zaczepić.

Przygotowałem kable, podłączyłem wszystko i teraz szukam IDCODE.

Oczywiście żaden program nic nie wykrywał, do czasu. Jeśli włączyłem programy w kolejności:  
urJtag -> podłaczenie się tylko do interfejsu USB-JTAG(oocdlink) -> quit  
ftjref -> profit, pobiera IDCODE !

Ważna uwaga, urJtag przy próbie detekcji IDCODE informuje, że sygnał TDO utknął na 0. Nie znam się, ale próbowałem podciągnąć TRST do VRef przez rezystor 3.3k (może za duży?) bo może źle przeprowadzana jest procedura resetu maszyny stanów jtaga. Jednak jak na razie to wszystko co ustaliłem.

Może ktokolwiek, kiedykolwiek miał nieco więcej do czynienia z jtagiem i może mi coś podpowiedzieć? Chciałbym naprawić to urządzenie. Zepsułem je w głupi sposób. Analizowałem dump flasha i znalazłem sposób na wejście w menu serwisowe. Przygotowałem sobie mały patch softu, tylko zamiast zaktualizować część którą nazywają Application, próbowałem wgrać część która nazywa się Product, czyli jakby cały system operacyjny. Niestety pierwszy etap programowania to czyszczenie flasha i całość poszła sobie w /dev/null zanim się zorientowałem, że popełniłem błąd.

Inna opcja która wchodzi w grę, to wylutowanie flasha i zaprogramowanie poza urządzeniem, ale to już ostateczność. Szczęśliwie flash jest bardzo typowy i dostępna jest pełna dokumentacja.