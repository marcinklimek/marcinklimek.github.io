---
title: "Lab - studnt"
date: 2023-04-24T17:13:33+02:00
draft: false
ShowToc: true

---

Treści programowe
=================

Wykłady
-------
1. Podstawowe typy architektur i pojęcia z nimi związane.
2. Problemy w implementacji architektury potokowej i superskalarnej; metody ich rozwiązywania i wynikające z nich podukłady mikroprocesorów.
3. Charakterystyka architektury wybranych współczesnych procesorów wykorzystywanych w urządzeniach stacjonarnych, mobilnych oraz superkomputerach.
4. Komunikacja pomiędzy procesorem, pamięcią a urządzeniami wejścia/wyjścia.
5. Charakterystyka architektury wybranych komputerów stacjonarnych oraz urządzeń mobilnych.
6. Współczesne pamięci operacyjne / podstawowe parametry statyczne i dynamiczne.
7. Typy magistral i ich parametry.
8. Benchmarki.
9. Charakterystyka mikrokomputerów jednoukładowych i ich przeznaczenie.

Ćwiczenia
---------
1. Analiza szybkości wykonywania operacji stało- i zmiennoprzecinkowych.
2. Analiza cyklu rozkazowego i potoku rozkazowego w jednym rdzeniu procesora jedno i wielordzeniowego.
3. Komunikacja z pamięcią oraz z urządzeniami wejścia/wyjścia oraz obsługa przerwań.

4. Analiza działania wybranych instrukcji i przykładowych programów w asemblerze wybranego procesora.
5. Tworzenie przykładowych programów w asemblerze z wykorzystaniem instrukcji warunkowych i pętli.
6. Oprogramowanie układu sterującego dla przykładowego zadania (np. sterowanie światłami na
skrzyżowaniu, obsługą żądań przywołania windy itp.).

Organizacja
===========
1. Jeśli ktoś jest zainteresowany, proponuję włączyć kamerę - m.in. na tej podstawie sprawdzam obecność
2. Aktywność generuje plusy 
3. Wyniki, rezultaty z ćwiczeń proszę wklejać na czat
4. Zaliczenie przedmiotu - kolokwium 
    1. Jeśli kolokwium to odbędzie się na przedostatnich zajęciach (zakres ściśle powiązany ze skryptem)
5. Zajęcia mają formułę warsztatów
    1. Trochę omawiamy temat
    2. Przeklejamy przykładowe programy lub programujemy je
    3. Uruchamiamy i badamy wyniki
6. W dowolnym momencie proszę pytać o cokolwiek, co jest związane z tematyką zajęć

Wstęp
=====

Kilka problemów związanych z architekturą procesora i organizacją systemu komputerowego:

1. Reordering instrukcji: Procesory mogą zmieniać kolejność wykonywania instrukcji, aby zoptymalizować wydajność. Może to prowadzić do problemów związanych z synchronizacją wątków i niezdefiniowanym zachowaniem. Aby temu zapobiec, można użyć odpowiednich metod synchronizacji, takich jak muteksy, blokady czy bariery pamięci.

2. Efekty związane z pamięcią cache: Dostęp do pamięci ma istotny wpływ na wydajność programu. Wysokiej wydajności algorytmy powinny być zaprojektowane z uwzględnieniem hierarchii pamięci, tak aby minimalizować opóźnienia związane z odwołaniami do pamięci. Można to osiągnąć, stosując techniki optymalizacji, takie jak blokowanie, użycie pamięci lokalnej czy cache-oblivious algorithms.

3. Równoczesność i współbieżność: Wykorzystanie wielowątkowości i wielordzeniowości procesorów może prowadzić do problemów związanych z dostępem do wspólnych zasobów, takich jak dane czy urządzenia wejścia/wyjścia. Aby zapewnić poprawną współpracę wątków, można stosować mechanizmy synchronizacji (muteksy, semafory, blokady) oraz techniki programowania równoległego, takie jak zadania, przetwarzanie równoległe czy potoki.

4. Wydajność arytmetyki zmiennoprzecinkowej: Obliczenia zmiennoprzecinkowe różnią się wydajnością w zależności od architektury procesora. Aby uzyskać najlepszą wydajność, można stosować optymalizacje specyficzne dla danego procesora, takie jak wektoryzacja, instrukcje SIMD czy optymalizacja obliczeń matematycznych.

5. Obsługa błędów sprzętowych: Błędy sprzętowe, takie jak błędy parzystości czy uszkodzenia pamięci, mogą wpłynąć na poprawność działania programu. Można zastosować techniki wykrywania i naprawy błędów, takie jak korekcja błędów pamięci czy sprawdzanie parzystości, aby zminimalizować ryzyko wprowadzenia błędów przez sprzęt.

Aby uniknąć tych problemów i zapewnić poprawne działanie programu, ważne jest zapoznanie się z architekturą procesora, na którym ma być uruchomiony program, oraz zastosowanie odpowiednich technik programowania i optymalizacji. Oto kilka dodatkowych wskazówek:

6. Endianness: Kolejność bajtów w reprezentacji liczb wielobajtowych (little-endian lub big-endian) różni się między różnymi architekturami procesorów. 

7. Wydajność operacji wejścia/wyjścia: Operacje wejścia/wyjścia mają znaczący wpływ na wydajność aplikacji. W przypadku programów wymagających intensywnego przepływu danych, należy zastosować techniki buforowania, asynchronicznych operacji wejścia/wyjścia oraz optymalizować użycie systemów plików i urządzeń wejścia/wyjścia.

8. Granice stronicowania: Dostęp do pamięci może być niejednorodny z powodu granic stronicowania. Aby uniknąć opóźnień związanych z przenoszeniem danych między stronami pamięci, można zastosować techniki takie jak wyrównywanie stronicowania (page alignment), stosowanie dużych stron (huge pages) czy ograniczenie fragmentacji pamięci.

9. Architektura NUMA (Non-Uniform Memory Access): W przypadku systemów wieloprocesorowych z architekturą NUMA, dostęp do pamięci może być wolniejszy dla niektórych rdzeni procesora. Aby zoptymalizować wydajność programów na takich systemach, można stosować techniki takie jak lokalność danych, afinitet rdzeni czy specjalne funkcje alokacji pamięci, takie jak `numa_alloc_onnode` i `numa_bind`.

10. Wsparcie dla instrukcji specyficznych dla procesora: Niektóre procesory mają instrukcje, które pozwalają na bardziej efektywne wykonanie określonych operacji. Można skorzystać z tych instrukcji, pisząc kod w asemblerze lub korzystając z bibliotek, które wykorzystują te instrukcje, takie jak biblioteki matematyczne czy algorytmiczne.

Aby uniknąć problemów związanych z architekturą procesora i organizacją systemu komputerowego, ważne jest, aby programować z uwzględnieniem tych zagadnień. Dobrym podejściem jest też korzystanie z bibliotek i narzędzi, które już zostały zoptymalizowane pod kątem różnych architektur i systemów.


> Ref:
> - [Measuring Jitter and Latency](http://www.cs.ru.nl/lab/xenomai/exercises_xenomai2.4/ex10/Exercise-10.html)
> - [logic gate simulator](https://academo.org/demos/logic-gate-simulator/)
> - [WSL](https://learn.microsoft.com/en-gb/windows/wsl/install-manual#step-2---check-requirements-for-running-wsl-2) !!
> - VirtualBox
> - [Mingw-w64](https://www.mingw-w64.org/)
> - [The microarchitecture of Intel, AMD, and VIA CPUs](https://agner.org/optimize/microarchitecture.pdf)

> - Architektura systoliczna - np. Edge TPU
> - [Google Coral Edge TPU explained in depth](https://qengineering.eu/google-corals-tpu-explained.html)
> - Cell (PS3) - PowerPC (PPE) + 7 x „Synergistic Processing Elements” (SPEs) [PlayStation 3](https://pl.wikipedia.org/wiki/PlayStation_3)
> - [Hardware for Deep Learning](https://blog.inten.to/hardware-for-deep-learning-current-state-and-trends-51c01ebbb6dc)
> - [Unlocking the Secrets of GPU Architecture](https://tp4348.medium.com/multithreaded-programs-on-gpu-7ae4dfbb19d3)
> - [A CPU is a compiler](https://lobste.rs/s/okcml7/cpu_is_compiler)

# Reprezentacja liczb

### System dziesiętny

Liczba 13910 jest zapisana w systemie dziesiętnym, co oznacza, że każda pozycja odpowiada potędze liczby 10. System pozycyjny to sposób zapisu liczb, w którym wartość liczby zależy od wartości cyfr i ich pozycji. W systemie wagowym wartość liczby jest sumą iloczynów cyfr i wag pozycji, gdzie wagi pozycji są potęgami podstawy systemu.

Liczba 13910 z rozbiciem na wagi poszczególnych pozycji:

    1 * 10^4 + 
    3 * 10^3 + 
    9 * 10^2 + 
    1 * 10^1 + 
    0 * 10^0 =
    
    10000 + 3000 + 900 + 10 + 0 = 13910

### System binarny

Konwersja liczby 13910 na zapis binarny:

    13910 : 2 = 6955 (reszta: 0)
    6955  : 2 = 3477 (reszta: 1)
    3477  : 2 = 1738 (reszta: 1)
    1738  : 2 = 869  (reszta: 0)
    869   : 2 = 434  (reszta: 1)
    434   : 2 = 217  (reszta: 0)
    217   : 2 = 108  (reszta: 1)
    108   : 2 = 54   (reszta: 0)
    54    : 2 = 27   (reszta: 0)
    27    : 2 = 13   (reszta: 1)
    13    : 2 = 6    (reszta: 1)
    6     : 2 = 3    (reszta: 0)
    3     : 2 = 1    (reszta: 1)
    1     : 2 = 0    (reszta: 1)
    
    Liczba binarna: 11 0110 0101 0110

**Ćwiczenie**

Zamienić na liczbę w notacji binarnej za pomocą powyższej metody:
- 19
- 1977



> Naturalny kod binarny to sposób zapisu liczb, w którym wartość liczby jest sumą iloczynów cyfr i wag pozycji, gdzie wagi pozycji są potęgami liczby 2.

Liczba 1011 0101 z rozbiciem na wagi poszczególnych pozycji:
   
    1 * 2^7 + 
    0 * 2^6 + 
    1 * 2^5 + 
    1 * 2^4 + 
    0 * 2^3 + 
    1 * 2^2 + 
    0 * 2^1 + 
    1 * 2^0 = 

    128 + 32 + 16 + 4 + 1 = 181


### System szesnastkowy

|   |      |   |      |
|---|------|---|------|
| 0 | 0000 | 8 | 1000 |  
| 1 | 0001 | 9 | 1001 |  
| 2 | 0010 | A | 1010 |  
| 3 | 0011 | B | 1011 |  
| 4 | 0100 | C | 1100 |  
| 5 | 0101 | D | 1101 |  
| 6 | 0110 | E | 1110 |  
| 7 | 0111 | F | 1111 | 

Aby przekonwertować liczbę binarną 1011011100101101 na szesnastkowy, można ją podzielić na grupy po 4 bity i przypisać im wartości szesnastkowe:

    1011 0111 0010 1101
       B    7    2    D

Liczba szesnastkowa: B72D


### Przechowywanie danych w komputerach

**Narysować pamięć**

Dane w komputerze są przechowywane w postaci binarnej, czyli za pomocą bitów (0 i 1). System binarny został wybrany ze względu na prostotę realizacji elektronicznej (wysokie i niskie napięcie) oraz łatwość przetwarzania informacji.

Rejestr to mały obszar pamięci w procesorze, używany do przechowywania wartości, które są obecnie przetwarzane. Słowo to ciąg bitów, który odpowiada długości rejestru lub jednostki przetwarzania danych.

Załóżmy, że mamy rejestr 8-bitowy. Aby zapisać wartość 139 (10001011) w rejestrze, wystarczy ustawić bity na odpowiednie wartości:
10001011

Ile bitów jest potrzebnych na zapisanie liczby 139, 255, 269, 513?

    139: 8 bitów (10001011)
    255: 8 bitów (11111111)
    269: 9 bitów (100001101)
    513: 10 bitów (1000000001)

Liczba potrzebnych bitów do zapisania każdej z tych liczb zależy od ich wartości w postaci binarnej. Aby określić minimalną ilość bitów potrzebną do zapisania danej liczby, można zastosować funkcję logarytmu dwójkowego (lub log2), a następnie zaokrąglić wynik w górę do najbliższej liczby całkowitej.

```python
math.ceil( math.log2(269) )
```

### Co to jest rejestr?

### Nadmiar i niedomiar

**Ćwiczenie**

- Czy wynik operacji mieści się w 8-bitowym rejestrze? (nadmiar czy niedomiar)
- Ile bitów potrzeba do reprezentacji wyniku?

1. Dodawanie:

        A = 127 (01111111)
        B = 4 (00000100)
        A + B = 131 (10000011)

2. Dodawanie:

        A = 139 (10001011)
        B = 147 (10010011)
        A + B = 286 (1 00010010) 
        efekt nadmiaru, wynik nie mieści się w 8-bitowym rejestrze.

W drugim przypadku mamy do czynienia z nadmiarem, co oznacza, że wynik przekracza maksymalną wartość, która może być przechowywana w 8-bitowym rejestrze (255).

3. Odejmowanie:

        A = 115 (01110011)
        B = 5 (00000101)
        C = A - B = 110 (01101110)

4. Odejmowanie:

        A = 129 (10000001)
        B = 167 (10100111)
        C = A - B = -38 (11011010)
        efekt niedomiaru, ponieważ wynik jest liczbą ujemną.

### Liczby ujemne

1. Z bitem znaku
2. U2


Aby zapisać liczbę -2 w 8-bitowym rejestrze, używamy kodu U2 (Uzupełnienie do 2):

    -2 = 11111110

Przykład dla liczby 10110101:
           
1. Jako liczba dodatnia: 

        1 * 2^7 + 
        0 * 2^6 + 
        1 * 2^5 + 
        1 * 2^4 + 
        0 * 2^3 + 
        1 * 2^2 + 
        0 * 2^1 + 
        1 * 2^0 = 

        128 + 32 + 16 + 4 + 1 = 181

2. Jako liczba ujemna (w kodzie U2): 

       ~1011 0101 + 1 = 
        0100 1010 + 1 = 0100 1011

        co daje: 64 + 8 + 2 + 1 = 75, 
        więc liczba to -75.

> Interpretacja liczby zależy od kontekstu. W przypadku liczb ujemnych często stosowany jest kod U2.

#### Kod U2

Uzupełnienie do 2, to metoda reprezentacji liczb całkowitych, zarówno dodatnich, jak i ujemnych, w systemie binarnym. W kodzie U2 liczby dodatnie są reprezentowane tak samo jak w naturalnym kodzie binarnym, natomiast liczby ujemne są reprezentowane jako dopełnienie do 2 liczby bezwzględnej.

Obliczanie reprezentację liczby ujemnej w kodzie U2:
1. Przekształć wartość bezwzględną liczby ujemnej na postać binarną.
2. Odwróć bity (zmień 0 na 1 i 1 na 0).
3. Dodaj 1 do wyniku.

Przykłady:

1. Przykład dla liczby -3:

       1. Wartość bezwzględna: 3 (w binarnym: 0000 0011)
       2. Odwrócenie bitów: 1111 1100
       3. Dodanie 1: 1111 1100 + 1 = 1111 1101

       Kod U2 dla liczby -3: 1111 1101

2. Przykład dla liczby -7:

       1. Wartość bezwzględna: 7 (w binarnym: 0000 0111)
       2. Odwrócenie bitów: 1111 1000
       3. Dodanie 1: 1111 1000 + 1 = 1111 1001

       Kod U2 dla liczby -7: 1111 1001

> Kod U2 jest często stosowany w komputerach, ponieważ pozwala na wykonywanie operacji dodawania i odejmowania przy użyciu tego samego sprzętu, niezależnie od znaku liczb.

**Ćwiczenie**

1. -7
2. -117

### Liczby rzeczywiste

    11 i 5/16 = 11.3125

Liczba 11 w postaci binarnej to 1011.

5/16 jako ułamek binarny to 0.0101 ponieważ 

     1 * (1/2)^3 + 
     0 * (1/2)^4 + 
     1 * (1/2)^5)

    0.3125 * 2 = 0.625 -> 0
    0.625  * 2 = 1.25  -> 1
    0.25   * 2 = 0.5   -> 0
    0.5    * 2 = 1     -> 1

Liczba 11 i 5/16 w postaci binarnej to: 1011.0101

Potrzebujemy 8 bitów na zapisanie tej liczby. Można zapisać ją w rejestrze jako liczba stałoprzecinkowa (zakładając, że przecinek jest zawsze pomiędzy bitami 3 i 4) lub używając notacji zmiennoprzecinkowej, która pozwala na zapisanie liczby z określoną precyzją i zakresem.


#### Zamiana na postać binarną

Aby przekształcić liczbę dziesiętną 10.75 na liczbę binarną, należy przekształcić osobno jej część całkowitą i część ułamkową.

1. Konwersja części całkowitej:
   
        Liczba całkowita: 10
        Postępujemy według metody dzielenia przez 2:

        10 / 2 = 5, reszta: 0
         5 / 2 = 2, reszta: 1
         2 / 2 = 1, reszta: 0
         1 / 2 = 0, reszta: 1

        Czytamy reszty od dołu do góry: 1010

2. Konwersja części ułamkowej:
   
        Liczba ułamkowa: 0.75
        Postępujemy według metody mnożenia przez 2:
        0.75 * 2 = 1.5 (zapisujemy cyfrę 1)
        0.50 * 2 = 1.0 (zapisujemy cyfrę 1)

        Czytam od góry do dołu: 11

Teraz, aby uzyskać postać binarną liczby 10.75, łączymy część całkowitą (1010) i część ułamkową (11) za pomocą przecinka binarnego: 1010.11

Stąd wynika, że liczba dziesiętna 10.75 jest równa liczbie binarnej 1010.11

> Uwaga
> Podczas konwersji liczby ułamkowej dziesiętnej na liczbę binarną za pomocą metody mnożenia przez 2, należy zakończyć mnożenie w jednym z następujących przypadków:
> 
> 1. Gdy wartość ułamkowa po mnożeniu wynosi dokładnie 0. Wtedy wszystkie kolejne mnożenia również będą dawały 0, a kolejne cyfry binarne po przecinku będą się składały wyłącznie z zer. W takiej sytuacji nie > ma potrzeby kontynuować obliczeń.
> 
> 2. Gdy osiągniesz żądaną precyzję. W praktyce, liczby binarne używane w komputerach mają ograniczoną precyzję (np. w przypadku liczb zmiennoprzecinkowych w standardzie IEEE-754). W związku z tym możemy > zakończyć mnożenie po osiągnięciu określonej liczby cyfr binarnych po przecinku.
> 
> 3. Gdy zauważysz cykliczne powtarzanie się wzoru cyfr. W niektórych przypadkach, liczby ułamkowe dziesiętne mają nieskończoną reprezentację binarną, która powtarza się cyklicznie. Kiedy zauważysz taki wzór, > możesz zakończyć mnożenie i zaokrąglić wynik do żądanej precyzji.
> 
> Należy pamiętać, że niektóre liczby ułamkowe dziesiętne mają nieskończoną reprezentację binarną, która nie wykazuje cyklicznego powtarzania się wzoru. W takich przypadkach, można zakończyć mnożenie, gdy > osiągnięta zostanie żądana precyzja, biorąc pod uwagę ograniczenia sprzętowe lub wymagania dotyczące zaokrąglenia.

#### Przykłady

1. Liczba dziesiętna 0.5:

        0.5 * 2 = 1.0 (zapisujemy cyfrę 1)
        Binarnie: 0.1

2. Liczba dziesiętna 0.25:

        0.25 * 2 = 0.5 (zapisujemy cyfrę 0)
        0.5 * 2 = 1.0 (zapisujemy cyfrę 1)
        Binarnie: 0.01

3. Liczba dziesiętna 0.625:

        0.625 * 2 = 1.25 (zapisujemy cyfrę 1)
        0.25 * 2 = 0.5 (zapisujemy cyfrę 0)
        0.5 * 2 = 1.0 (zapisujemy cyfrę 1)
        Binarnie: 0.101

4. Liczba dziesiętna 0.375:

        0.375 * 2 = 0.75 (zapisujemy cyfrę 0)
        0.75 * 2 = 1.5 (zapisujemy cyfrę 1)
        0.5 * 2 = 1.0 (zapisujemy cyfrę 1)
        Binarnie: 0.011

5. Liczba dziesiętna 0.1977:

        0.1977 * 2 = 0.3954 -> (0.0)
        0.3954 * 2 = 0.7908 -> (0.00)
        0.7908 * 2 = 1.5816 -> (0.001)
        0.5816 * 2 = 1.1632 -> (0.0011)
        0.1632 * 2 = 0.3264 -> (0.00110)
        0.3264 * 2 = 0.6528 -> (0.001100)
        0.6528 * 2 = 1.3056 -> (0.0011001)

>Warto zauważyć, że niektóre liczby ułamkowe w systemie dziesiętnym nie mają dokładnej reprezentacji w systemie binarnym.

6. Liczba dziesiętna 0.1:

        0.1 * 2 = 0.2 (zapisujemy cyfrę 0)
        0.2 * 2 = 0.4 (zapisujemy cyfrę 0)
        0.4 * 2 = 0.8 (zapisujemy cyfrę 0)
        0.8 * 2 = 1.6 (zapisujemy cyfrę 1)
        0.6 * 2 = 1.2 (zapisujemy cyfrę 1)
        0.2 * 2 = 0.4 (zapisujemy cyfrę 0)
        ...
        Binarnie: 0.0001100110011... (cyfry się powtarzają)

W takich przypadkach reprezentacja binarna będzie nieskończoną liczbą cyfr po przecinku i musi zostać zaokrąglona, aby zmieścić się w określonym formacie, takim jak standard IEEE-754.

#### Notacja zmiennoprzecinkowa

W komputerach najczęściej stosowaną notacją zmiennoprzecinkową jest standard IEEE-754. Standard ten definiuje formaty reprezentacji liczb zmiennoprzecinkowych, takie jak pojedyncza precyzja (32 bity) i podwójna precyzja (64 bity). Standard IEEE-754 pozwala na zapisanie liczb z określoną precyzją, zakresem i specjalnymi wartościami (takimi jak nieskończoność i NaN). Na niektórych platformach dostępny jest typ half-float (NVidia CUDA) o połowicznej precyzji (16 bitów)

Reprezentacja liczby zmiennoprzecinkowej w standardzie IEEE-754 składa się z trzech części:
1. Znak (Sign) - jeden bit, który reprezentuje znak liczby (0 - dodatnia, 1 - ujemna).
2. Wykładnik (Exponent) - ciąg bitów reprezentujący wykładnik liczby, przesunięty o wartość stałą (bias). Dla formatu pojedynczej precyzji przesunięcie wynosi 127, a dla podwójnej precyzji wynosi 1023.
3. Mantysa (Significand) - ciąg bitów reprezentujący wartość liczby znormalizowanej, ale bez pierwszego bitu (1), który jest zawsze niejawny (chyba że liczba jest denormalizowana).


![IEEE-754](images/IEEE754.png)

Tworzenie reprezentacji binarnej liczby zmiennoprzecinkowej w standardzie IEEE-754:

1. Określ znak liczby (0 dla dodatniej, 1 dla ujemnej).
2. Zamienić część dziesiętną oraz ułamkową na postać binarną.
2. Przekształć liczbę na postać znormalizowaną w notacji naukowej (1.x * 2^n).
3. Oblicz wykładnik, dodając przesunięcie (bias) do n (wykładnik notacji naukowej).
4. Przekształć mantysę na postać binarną, pomijając pierwszy bit (1).
5. Złożyć reprezentację z części znakowej, wykładnika i mantysy.

Przykład:

Chcemy zapisać liczbę 10.75 jako liczbę zmiennoprzecinkową w standardzie IEEE-754 (pojedyncza precyzja).

1. Liczba jest dodatnia, więc znak to 0.
2. Postać binarną: 10.75 = 1010.11
2. Postać znormalizowana: 1.01011 * 2^3
3. Wykładnik: 3 + 127 (bias) = 130, w postaci binarnej: 10000010
4. Mantysa (bez pierwszego bitu): 0101100... (w sumie 23 bity)
5. Składamy reprezentację: 0 10000010 01011000000000000000000

Reprezentacja liczby 10.75 w standardzie IEEE-754 (pojedyncza precyzja) to:


    32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1
    0  1  0  0  0  0  0  1  0  0  1  0  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0

    1 * 2^3 * 1.34375 = 10.75

> Ref: 
> - [http://www.cburch.com/books/float/](http://www.cburch.com/books/float/)
> - [Float Toy](http://evanw.github.io/float-toy/)
> - [What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/800-7895/800-7895.pdf) 

# Kolejność bajtów

Przykład reprezentacji liczby 32-bitowej (4-bajtowej) w różnych kolejnościach bajtów:

Wartość: 0x12345678

- Little-endian: 78 56 34 12
- Big-endian: 12 34 56 78

Poniżej znajduje się przykładowy program w C++, który demonstruje różne kolejności bajtów:

**Lab_01:**
```cpp
#include <iostream>
#include <cstdint>

union EndianTest {
    uint32_t i;
    uint8_t c[4];
};

int main() {
    EndianTest test;
    test.i = 0x12345678;

    std::cout << "System ma następującą kolejność bajtów: ";
    if (test.c[0] == 0x78 && test.c[1] == 0x56 && test.c[2] == 0x34 && test.c[3] == 0x12) {
        std::cout << "Little-endian" << std::endl;
    } else if (test.c[0] == 0x12 && test.c[1] == 0x34 && test.c[2] == 0x56 && test.c[3] == 0x78) {
        std::cout << "Big-endian" << std::endl;
    } else {
        std::cout << "Nieznana" << std::endl;
    }

    return 0;
}
```

Różne procesory używają różnych kolejności bajtów:

- Little-endian: Procesory Intel x86, x86-64 oraz większość mikrokontrolerów ARM (w trybie little-endian).
- Big-endian: Procesory Motorola 68k, PowerPC, IBM z/Architecture, a także niektóre mikrokontrolery ARM (w trybie big-endian).

Wybór kolejności bajtów jest często wynikiem decyzji projektowych, które miały na celu ułatwienie lub optymalizację wykonywania określonych operacji. Little-endian jest popularne ze względu na prostotę dodawania i odejmowania liczb o zmiennej długości oraz łatwiejszą obsługę liczb o mniejszej precyzji w reprezentacji o większej precyzji. Big-endian jest częściej stosowany w systemach, które muszą współpracować z sieciami komputerowymi, gdzie bajty są przesyłane od najbardziej znaczącego do najmniej znaczącego, co ułatwia interpretację wartości przesyłanych danych.

> Ref:
> - [Jak to jest z tym little-endian](https://blog.fabrykowski.pl/little-endian.html)

# Wykonywania operacji stało- i zmiennoprzecinkowych:

FPU (Floating Point Unit) to podzespoły procesora odpowiedzialne za wykonywanie operacji arytmetycznych na liczbach zmiennoprzecinkowych. Liczba jednostek FPU może się różnić w zależności od architektury i modelu procesora. Oto kilka przykładów:

1. Intel Core i7-8700K (8. generacja Core)
- 6 rdzeni, każdy z jednostką FPU - 6 jednostek FPU.

2. AMD Ryzen 7 3700X (3. generacja Ryzen)
- 8 rdzeni, każdy z jednostką FPU - 8 jednostek FPU.

3. Apple M1 (ARM-based)
- 8 rdzeni CPU (4 wysokiej wydajności i 4 energooszczędne), każdy z jednostką FPU - 8 jednostek FPU.

4. IBM POWER9
- 12 lub 24 rdzenie, w zależności od konfiguracji. Każdy rdzeń ma jedną jednostkę FPU - 12 lub 24 jednostki FPU.

5. NVIDIA A100 (GPU)
- W przypadku GPU, jednostki FPU są zintegrowane z procesorami strumieniowymi (CUDA cores). NVIDIA A100 posiada 6912 rdzeni CUDA.

Warto zauważyć, że w przypadku GPU, jednostki FPU mogą być wykorzystywane do obliczeń równoległych, ale zwykle nie są one traktowane jako oddzielne jednostki, tak jak w przypadku CPU.


## Porównanie czasu wykonywania

Porównanie czasu wykonywania dodawania, odejmowania, mnożenia i dzielenia dla liczby stałoprzecinkowej (int) i zmiennoprzecinkowej (float, double).

1. Utwórz program, który generuje losowe liczby int oraz float (lub double) i wykonuje podstawowe operacje matematyczne.
2. Zmierz czas wykonania każdej operacji dla różnych precyzji.
3. Porównaj wyniki i zastanów się nad wpływem precyzji na czas wykonania operacji.

**Lab_02:**

```cpp
#include <iostream>
#include <iomanip>
#include <chrono>
#include <random>
#include <vector>

using namespace std;
using namespace std::chrono;

template <typename T,std::enable_if_t<std::is_integral<T>::value, bool> =true>
T generateRandomNumber(T min, T max)
{
    static random_device rd;
    static mt19937 gen(rd());
    uniform_int_distribution<T> dist(min, max);
    return dist(gen);
}

template <typename T,std::enable_if_t<std::is_floating_point<T>::value, bool> = true>
T generateRandomNumber(T min, T max)
{
    static random_device rd;
    static mt19937 gen(rd());
    uniform_real_distribution<T> dist(min, max);
    return dist(gen);
}


template <typename T>
T complex_operation(T a, T b)
{
    T result = (a + b) * (a - b) / (a * b); // +std::sin(a) - std::cos(b);
    return result;
}

template <typename T>
void perform_operations(const std::string& data_type)
{
    const auto num_operations = 10LL;

    std::vector<T> a(num_operations), b(num_operations);

    for (int i = 0; i < num_operations; ++i) 
    {
        a[i] = static_cast<T>(generateRandomNumber<T>(1, 1000));
        b[i] = static_cast<T>(generateRandomNumber<T>(1, 1000));
    }

    T result = 0;
    auto start = high_resolution_clock::now();
    for (auto i = 0; i < num_operations; ++i) 
        result += complex_operation(a[i], b[i]);
    

    const auto end = high_resolution_clock::now();
    const duration<double, std::milli> elapsed = end - start;

    std::cout << "Time taken for " << data_type << ": " << elapsed.count() << " ms" << " " << result << std::endl;
}


int main()
{
    perform_operations<int>("int");
    perform_operations<float>("float");
    perform_operations<double>("double");

    return 0;
}
```

Ten program w C++ analizuje wpływ precyzji zmiennoprzecinkowej na czas wykonania operacji. Wykonuje on podstawowe operacje matematyczne (`+`, `-`, `*`, `/`) na liczbach `całkowitych`oraz zmiennoprzecinkowych o różnych precyzjach (`float`, `double`) i mierzy czas wykonania tych operacji za pomocą biblioteki `<chrono>`.

Po skompilowaniu i uruchomieniu programu, na konsoli zostaną wyświetlone wyniki czasu wykonania operacji dla różnych precyzji. Należy przeanalizować wyniki i zastanowić się nad wpływem precyzji na czas wykonania operacji.

## Obliczanie czasu wykonywania operacji na macierzach stało- i zmiennoprzecinkowych.

1. Napisz program, który mnoży dwie macierze o ustalonych rozmiarach, używając typów stałoprzecinkowych (int) oraz zmiennoprzecinkowych (float, double).
2. Zmierz czas wykonania mnożenia macierzy dla różnych rozmiarów macierzy.
3. Porównaj wyniki i omów znaczenie różnic w czasie wykonania dla różnych typów danych.

**Lab_04:**
```cpp
#include <iostream>
#include <chrono>
#include <vector>

using namespace std;
using namespace std::chrono;

template <typename T>
void multiply_matrices(const vector<vector<T>> &matrix1, const vector<vector<T>> &matrix2, vector<vector<T>> &result) {
    size_t rows = matrix1.size();
    size_t cols = matrix2[0].size();
    size_t inner = matrix1[0].size();

    for (size_t i = 0; i < rows; ++i) {
        for (size_t j = 0; j < cols; ++j) {
            result[i][j] = 0;
            for (size_t k = 0; k < inner; ++k) {
                result[i][j] += matrix1[i][k] * matrix2[k][j];
            }
        }
    }
}

template <typename T>
void test_matrix_multiplication(int size, const string &type_name) {
    // Inicjalizacja macierzy
    vector<vector<T>> matrix1(size, vector<T>(size, static_cast<T>(2)));
    vector<vector<T>> matrix2(size, vector<T>(size, static_cast<T>(3)));
    vector<vector<T>> result(size, vector<T>(size, static_cast<T>(0)));

    // Mierzenie czasu mnożenia macierzy
    auto start_time = high_resolution_clock::now();
    multiply_matrices(matrix1, matrix2, result);
    auto end_time = high_resolution_clock::now();

    auto duration = duration_cast<milliseconds>(end_time - start_time).count();
    cout << "Czas wykonania mnożenia macierzy " << size << "x" << size << " dla typu " << type_name << ": " << duration << " milisekund" << endl;
}

int main() {
    // Przetestuj mnożenie macierzy dla różnych rozmiarów i typów danych
    test_matrix_multiplication<int>(100, "int");
    test_matrix_multiplication<float>(100, "float");
    test_matrix_multiplication<double>(100, "double");

    test_matrix_multiplication<int>(500, "int");
    test_matrix_multiplication<float>(500, "float");
    test_matrix_multiplication<double>(500, "double");

    test_matrix_multiplication<int>(1000, "int");
    test_matrix_multiplication<float>(1000, "float");
    test_matrix_multiplication<double>(1000, "double");

    cout << "Porównaj wyniki i omów znaczenie różnic w czasie wykonania dla różnych typów danych." << endl;

    return 0;
}
```

Program mnoży dwie macierze o ustalonych rozmiarach, używając typów stałoprzecinkowych (`int`) oraz zmiennoprzecinkowych (`float`, `double`). Następnie, mierzy czas wykonania mnożenia macierzy dla różnych rozmiarów macierzy (100x100, 500x500, 1000x1000) i porównuje wyniki dla różnych typów danych.

Po skompilowaniu i uruchomieniu programu, na konsoli zostaną wyświetlone wyniki czasu wykonania mnożenia macierzy dla różnych rozmiarów macierzy i typów danych. Porównaj wyniki i omów znaczenie różnic w czasie wykonania dla różnych typów danych.

Wyniki mogą się różnić w zależności od sprzętu i kompilatora. Analizuj różnice między typami danych (stałoprzecinkowe i zmiennoprzecinkowe) oraz rozmiarami macierzy. Zwróć uwagę na to, jak zmienia się czas wykonania w zależności od typu danych i rozmiaru macierzy. Zastanów się, jak te różnice wpływają na wydajność w praktycznych zastosowaniach, takich jak obliczenia naukowe, analiza danych czy grafika komputerowa.

W praktyce, wybór między typami danych zależy od wymagań dotyczących precyzji, wydajności i dostępnych zasobów. W przypadku obliczeń naukowych i analizy danych, precyzja może być kluczowa, ale jednocześnie może wpłynąć na czas wykonania. W grafice komputerowej, mniejsza precyzja może być akceptowalna, ale szybsze obliczenia mogą być kluczowe dla płynności działania aplikacji.


## Eksperyment z optymalizacją kodu.

1. Napisz prosty program, który wykonuje operacje matematyczne na liczbach stało- i zmiennoprzecinkowych.
2. Skompiluj i uruchom program z różnymi poziomami optymalizacji (np. -O0, -O1, -O2, -O3).
3. Porównaj czas wykonania programu dla różnych poziomów optymalizacji i zastanów się, jak optymalizacja wpływa na wydajność operacji stało- i zmiennoprzecinkowych.

## Wprowadzenie do instrukcji SIMD.

1. Zapoznaj się z instrukcjami SIMD (Single Instruction, Multiple Data) dostępnymi dla Twojego procesora (np. SSE, AVX).
2. Napisz program, który wykonuje operacje matematyczne na wektorach liczb stało- i zmiennoprzecinkowych, wykorzystując instrukcje SIMD.
3. Porównaj czas wykonania operacji wektorowych z użyciem SIMD do czasu wykonania operacji

Aby użyć instrukcji SIMD w C++, możemy wykorzystać bibliotekę `immintrin.h`, która obsługuje instrukcje SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, AVX, AVX2 i AVX-512.

Poniżej znajduje się przykład programu w C++, który wykonuje operacje dodawania na wektorach liczb stało- i zmiennoprzecinkowych, wykorzystując instrukcje SIMD. Porównuje czas wykonania operacji wektorowych z użyciem SIMD do czasu wykonania operacji bez SIMD.

```cpp
#include <iostream>
#include <chrono>
#include <vector>
#include <immintrin.h>

using namespace std;
using namespace std::chrono;

const int vector_size = 1000000;

template <typename T>
void add_vectors(const vector<T> &a, const vector<T> &b, vector<T> &result) {
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] + b[i];
    }
}

void add_vectors_simd(const vector<float> &a, const vector<float> &b, vector<float> &result) {
    size_t simd_length = a.size() / 8;

    for (size_t i = 0; i < simd_length; ++i) {
        __m256 vec_a = _mm256_loadu_ps(&a[i * 8]);
        __m256 vec_b = _mm256_loadu_ps(&b[i * 8]);
        __m256 vec_result = _mm256_add_ps(vec_a, vec_b);
        _mm256_storeu_ps(&result[i * 8], vec_result);
    }
}

template <typename T>
void test_add_vectors(const string &type_name) {
    vector<T> a(vector_size, static_cast<T>(1));
    vector<T> b(vector_size, static_cast<T>(2));
    vector<T> result(vector_size, static_cast<T>(0));

    auto start_time = high_resolution_clock::now();
    add_vectors(a, b, result);
    auto end_time = high_resolution_clock::now();

    auto duration = duration_cast<milliseconds>(end_time - start_time).count();
    cout << "Czas wykonania dodawania wektorów bez SIMD dla " << type_name << ": " << duration << " ms" << endl;
}

void test_add_vectors_simd_float() {
    vector<float> a(vector_size, 1.0f);
    vector<float> b(vector_size, 2.0f);
    vector<float> result(vector_size, 0.0f);

    auto start_time = high_resolution_clock::now();
    add_vectors_simd(a, b, result);
    auto end_time = high_resolution_clock::now();

    auto duration = duration_cast<milliseconds>(end_time - start_time).count();
    cout << "Czas wykonania dodawania wektorów z użyciem SIMD dla float: " << duration << " ms" << endl;
}

int main() {
    test_add_vectors<int>("int");
    test_add_vectors<float>("float");
    test_add_vectors<double>("double");

    test_add_vectors_simd_float();

    return 0;
}
```

W tym przypadku, używamy instrukcji SIMD dla operacji dodawania wektorów zmiennoprzecinkowych (`float`). Program porównuje czas wykonania operacji wektorowych z użyciem SIMD do czasu wykonania operacji bez SIMD dla typów `int`, `float` i `double`. Po skompilowaniu i uruchomieniu programu, na konsoli zostaną wyświetlone wyniki czasu wykonania dodawania wektorów dla różnych typów danych, zarówno z użyciem SIMD, jak i bez.

Wyniki mogą się różnić w zależności od sprzętu i kompilatora, ale zazwyczaj SIMD przyspiesza obliczenia wektorowe, gdyż pozwala na wykonywanie operacji na wielu elementach danych jednocześnie.

W praktyce, wykorzystanie SIMD może prowadzić do znacznego przyspieszenia obliczeń wektorowych, szczególnie w zastosowaniach, takich jak grafika komputerowa, analiza danych czy przetwarzanie sygnałów. Jednak warto pamiętać, że nie wszystkie operacje mogą być przyspieszone przy użyciu SIMD, a także, że optymalizacja przy użyciu SIMD może zwiększyć złożoność kodu i utrudnić jego utrzymanie.


> Ref:
> - [Native code performance on modern CPUs](https://www.cppstories.com/2014/04/presentation-native-code-performance-on-modern-cpus/)


# Porównawczy kod w asemblerze

Poniżej znajduje się przykład programu napisanego w asemblerze x86, który porównuje czas wykonania operacji dodawania, odejmowania, mnożenia i dzielenia dla liczby stałoprzecinkowej (int) i zmiennoprzecinkowej (float, double). Program korzysta z polecenia RDTSC do mierzenia czasu wykonania operacji.

```nasm
format PE GUI 4.0
entry start

include 'win32w.inc'

section '.text' code readable executable

start:

    ; Licznik petli dla liczby staloprzecinkowej (int)
    mov ecx, [iterations]

    ; Pobranie czasu startowego
    rdtsc
    mov edi, eax

int_loop:

    mov eax, [int_a]
    mov ebx, [int_b]

    ; Dodawanie
    add eax, ebx

    ; Odejmowanie
    sub eax, ebx

    ; Mnozenie
    imul eax, ebx

    ; Dzielenie
    xor edx, edx
    idiv ebx

    ; Nastepna iteracja
    loop int_loop

    ; Pobranie czasu koncowego
    rdtsc
    sub eax, edi
    mov [int_duration], eax

    ; Licznik petli dla liczby zmiennoprzecinkowej (float)
    mov ecx, [iterations]

    ; Pobranie czasu startowego
    rdtsc
    mov edi, eax

float_loop:
    ; Wczytanie liczb zmiennoprzecinkowych do rejestrów
    fld [float_a]
    fld [float_b]

    ; Dodawanie
    faddp st1, st0

    ; Odejmowanie
    fsubp st1, st0

    ; Mnozenie
    fmulp st1, st0

    ; Dzielenie
    fdivp st1, st0

    ; Nastepna iteracja
    loop float_loop

    ; Pobranie czasu koncowego
    rdtsc
    sub eax, edi
    mov [float_duration], eax

    ; Zakonczenie programu
    invoke ExitProcess, 0

section '.data' data readable writeable

  iterations dd 1000000

  ; Stale dla liczb staloprzecinkowych
  int_a dd 123
  int_b dd 456

  ; Stale dla liczb zmiennoprzecinkowych
  float_a dd 123.456f
  float_b dd 456.789f

  ; Rezerwacja miejsca na zmienne
  int_duration dd ?
  float_duration dd ?

section '.idata' import data readable writeable

  library kernel32,'KERNEL32.DLL',\
  user32,'USER32.DLL'

  include 'api\kernel32.inc'
  include 'api\user32.inc'
```

Aby skompilować i uruchomić program, można użyć narzędzi NASM i LD lub fasm

Należy pamiętać, że ten program nie wypisuje wyników na ekran, ale przechowuje je w zarezerwowanych zmiennych `int_duration` i `float_duration`. Aby wyświetlić wyniki, można dodać kod odpowiedzialny za wypisanie wartości na ekran, korzystając z systemu wywołań (syscalls) lub użyć debuggera, aby przejrzeć wartości tych zmiennych

> Ref:
> - [x64dbg](https://x64dbg.com/)

# Architektura von Neumana

Architektura komputerów Von-Neumanna, zaproponowana przez Johna von Neumanna, opiera się na koncepcji przechowywania programów w pamięci komputera. Wcześniej, maszyny liczące były projektowane tak, aby wykonywać jedno konkretne zadanie i nie można było ich przeprogramować. Architektura von Neumanna wprowadziła założenie, że programy i dane mogą być przechowywane w tej samej pamięci, co umożliwiło rozwój maszyn uniwersalnych, które mogą wykonywać różne zadania.

![Architektura von Neumana](images/basic_structure.png)

Podstawowe elementy architektury von Neumanna obejmują:

1. Pamięć: Służy do przechowywania danych i programów. Pamięć może być podzielona na dwie części: pamięć operacyjną (RAM) i pamięć trwałą (np. dysk twardy).

2. Procesor: Składa się z jednostki arytmetyczno-logicznej (ALU) oraz jednostki sterującej. ALU wykonuje operacje arytmetyczne i logiczne na danych, podczas gdy jednostka sterująca zarządza sekwencją operacji, odczytuje instrukcje z pamięci i decyduje, jakie operacje mają zostać wykonane.

3. Wejście/wyjście (I/O): Odpowiada za komunikację z urządzeniami zewnętrznymi, takimi jak klawiatura, mysz, monitor, drukarka itp.

4. System komunikacji: Składa się z szyny danych, szyny adresowej i szyny kontrolnej, które łączą poszczególne elementy komputera i umożliwiają wymianę informacji między nimi.

Architektura komputerów Von-Neumanna jest podstawą dla większości współczesnych komputerów i urządzeń, takich jak komputery osobiste, laptopy, serwery czy smartfony. Wraz z postępem technologicznym i rozwojem układów scalonych oraz mikroprocesorów, architektura von Neumanna została udoskonalona i przekształcona, ale jej podstawowe zasady wciąż pozostają aktualne.


ISA (Instruction set architecture) i posiada trzy podstawowe jednostki:  

1. Centralna Jednostka Przetwarzająca (CPU) 
    1. Control Unit(CU)
    2. Jednostka arytmetyczna i logiczna (ALU)
    3. Rejestry
2. Jednostka pamięci głównej 
3. Urządzenie wejścia/wyjścia 

## Przykładowa symulacja architektury

```c#
using System;

class ControlUnit
{
    public int ProgramCounter { get; set; }
    public int MemoryAddressRegister { get; set; }
    public int MemoryDataRegister { get; set; }
    public int CurrentInstructionRegister { get; set; }
    public int InstructionBufferRegister { get; set; }

    public ControlUnit()
    {
        ProgramCounter = 0;
        MemoryAddressRegister = 0;
        MemoryDataRegister = 0;
        CurrentInstructionRegister = 0;
        InstructionBufferRegister = 0;
    }

    public void FetchInstruction()
    {
    }

    public void ExecuteInstruction()
    {
    }
}

class ALU
{
    public int Accumulator { get; set; }

    public ALU()
    {
        Accumulator = 0;
    }

    public void Add(int a, int b)
    {
    }

    public void Subtract(int a, int b)
    {
    }

    public void Compare(int a, int b)
    {
    }

    public void PerformLogicOperation(int a, int b, string operation)
    {
    }

    public void ShiftBits(int value, string direction, int amount)
    {
    }
}

class CPU
{
    public ControlUnit ControlUnit { get; set; }
    public ALU Alu { get; set; }

    public CPU()
    {
        ControlUnit = new ControlUnit();
        Alu = new ALU();
    }

    public void Run()
    {
    }
}

class MainMemory
{
    public int[] Memory { get; set; }

    public MainMemory(int size)
    {
        Memory = new int[size];
    }

    public void Read(int address)
    {
    }

    public void Write(int address, int value)
    {
    }
}

class IODevice
{
    public void InputData()
    {
    }

    public void OutputData(int data)
    {
    }
}

class Computer
{
    public CPU Cpu { get; set; }
    public MainMemory Memory { get; set; }
    public IODevice IoDevice { get; set; }

    public Computer(int memorySize)
    {
        Cpu = new CPU();
        Memory = new MainMemory(memorySize);
        IoDevice = new IODevice();
    }

    public void LoadProgram(int[] program)
    {
    }

    public void Run()
    {
    }
}

class Program
{
    static void Main(string[] args)
    {
        Computer computer = new Computer(memorySize: 1024);
        // Load a program into the computer
        // computer.LoadProgram(program);
        computer.Run();
    }
}
```

**Przykład Lab_31.py**


## Instrukcje symulatora

Procesor posiada tylko jeden rejestr, akumulator A. Możliwe jest adresowanie bezpośrednie i pośrednie. Załóżmy, że akumulator jest 32bitowy.

- HLT  - Zatrzymanie pracy
- LDA <> - Załadowanie do **A** danych z adresu 
- STA  - Wpisanie pod zadany adres w argumencie, wartości z rejestru A
- LDI  - Załadowanie do **A** danych z adresu wskzanego pod podanym adresem 
- INP  - Załadowanie danych do A z urządzenia we/wy
- OUT  - Wysłanie wartości A na wyjście
- ADD  - Dodanie wartości z pamięci wskazanej przez argument do **A**
- SUB  - Odjęcie od **A** wartości z pamięci wskazanej przez argument
- CMP  - Porównanie **A** z wartoścą pamięci wskazanej przez argument, wynik w **A** 0 jesli równe, 1 jeśli różne
- MOV  - Wpisanie do **A** bezpośredniej wartości
- INC  - Zwiększenie **A** o jeden
- DEC  - Zmniejszenie **A** o jeden
- JMP  - Skok bezwarunkowy
- JZ   - Skok jeśli **A** jest równe zero

Składnia assemblera:

:etykieta - etykieta, wskazująca na miejsce w pamięci 

@etykieta - poinformowanie kompilator, aby zamienił wskazanie na adres etykiety w pamięci


Przykłady:

Wypisanie liczby 10 na wyjście

```
    MOV 10
    OUT

    HLT

```

Dodawanie

```
    MOV 10
    STA @value 

    MOV 15
    ADD @value

    OUT

    HLT

:value
    0
```

Adresowanie bezpośrednie

```
    LDA @location
    OUT

    HLT

:value
    42
```

Adresowanie pośrednie

```
    LDI @location
    OUT

    MOV 42
    STA @value
    LDI @location
    OUT
    
    HLT

:location
    @value
:value
    37
```

Pętla

```
    MOV 10
:loop
    OUT
    DEC
    JZ @exit
    JMP @loop

:exit
    OUT
    HLT
```

**Ćwiczenia**

dodac dwie liczby znajdujące się w pamięci

```
:value
    3
    141



```
- wypisac liczby znajdujące się w pamięci az napotkamy 0:
```
:value
    3
    141
    5
    92
    65
    35
    89
    79
    0
```

- zsumować liczby znajdujące się w pamięci, zakończyć jak napotkamy 0:
```
:value
    1
    2
    3
    4
    5
    6
    7
    8
    0
```

- wypisac na wyjście kolejne wartości ciągu fibonacciego, kilka pierwszych. Dla uproszczenia można dwie początkowe zapisać od razu w kodzie, np.:
```
    :fib1
    0
    
    :fib2
    1
```


## Symulator

```c#
var ioDevice = new IODevice();
var computer = new Computer(256, ioDevice);

var compiler = new Compiler();
var compiledProgram = compiler.Compile(sourceCode_dump);

computer.LoadProgram(compiledProgram);
computer.Run();

enum OpCode
{
    HLT = 0x00,
    LDA = 0x01,
    STA = 0x02,
    LDI = 0x03,
    INP = 0x04,
    OUT = 0x05,
    ADD = 0x06,
    SUB = 0x07,
    CMP = 0x08,
    MOV = 0x09,
    INC = 0x0a,
    DEC = 0x0b,
    JMP = 0x0c,
    JZ  = 0x0d,
    MEM = 0x0e,

    DB  = 0x0
}

class ControlUnit
{
    private bool _debug;

    private int ProgramCounter { get; set; }
    private int MemoryAddressRegister { get; set; }
    private int MemoryDataRegister { get; set; }
    private int CurrentInstructionRegister { get; set; }


    public ControlUnit(bool debug = false)
    {
        _debug = debug;

        ProgramCounter = 0;
        MemoryAddressRegister = 0;
        MemoryDataRegister = 0;
        CurrentInstructionRegister = 0;
    }

    public void FetchInstruction(MainMemory memory)
    {
        MemoryAddressRegister = ProgramCounter;
        MemoryDataRegister = memory.Read(MemoryAddressRegister);
        CurrentInstructionRegister = MemoryDataRegister;
        ProgramCounter += 1;
    }

    public void PrintInstruction(OpCode opcode, CPU cpu, MainMemory memory, IODevice ioDevice)
    {
        if (!_debug)
            return;

        Console.WriteLine($"#{ProgramCounter:X3} A:{cpu.ALU.Accumulator:X3} ({cpu.ALU.Accumulator:D3}) -> {opcode.ToString()} {MemoryAddressRegister:X3} {MemoryDataRegister:X3}");
    }

    public bool ExecuteInstruction(CPU cpu, MainMemory memory, IODevice ioDevice)
    {
        var instruction = (OpCode)CurrentInstructionRegister;
        
        PrintInstruction(instruction, cpu, memory, ioDevice);

        switch (instruction)
        {
            case OpCode.HLT:
                Console.WriteLine($"HALT encountered at address {ProgramCounter:X2}");
                return false;
            case OpCode.LDA:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                MemoryDataRegister = memory.Read(MemoryAddressRegister);
                cpu.ALU.Accumulator = MemoryDataRegister;
                
                ProgramCounter += 1;
                break;
            case OpCode.LDI:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                MemoryAddressRegister = memory.Read(MemoryAddressRegister);
                MemoryDataRegister = memory.Read(MemoryAddressRegister);
                cpu.ALU.Accumulator = MemoryDataRegister;
                
                ProgramCounter += 1;
                break;
            case OpCode.STA:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                MemoryDataRegister = cpu.ALU.Accumulator;
                memory.Write(MemoryAddressRegister, MemoryDataRegister);

                ProgramCounter += 1;
                break;
            case OpCode.INP:
                cpu.ALU.Accumulator = ioDevice.InputData();
                break;
            case OpCode.OUT:
                ioDevice.OutputData(cpu.ALU.Accumulator);
                break;
            case OpCode.MEM:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                for (var i = 0; i < cpu.ALU.Accumulator; i++)
                {
                    var data = memory.Read(MemoryAddressRegister + i);
                    ioDevice.OutputData(data);
                }

                ProgramCounter++;
                break;
            case OpCode.ADD:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                MemoryDataRegister = memory.Read(MemoryAddressRegister);
                cpu.ALU.Add(MemoryDataRegister);

                ProgramCounter += 1;
                break;
            case OpCode.SUB:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                MemoryDataRegister = memory.Read(MemoryAddressRegister);
                cpu.ALU.Subtract(MemoryDataRegister);
                
                ProgramCounter += 1;
                break;
            case OpCode.CMP:
                MemoryAddressRegister = memory.Read(ProgramCounter);
                MemoryDataRegister = memory.Read(MemoryAddressRegister);
                cpu.ALU.Compare(MemoryDataRegister);
                
                ProgramCounter += 1;
                break;
            case OpCode.MOV:
                var value = memory.Read(ProgramCounter);
                cpu.ALU.Accumulator = value;
                PrintInstruction(instruction, cpu, memory, ioDevice);
                
                ProgramCounter += 1;
                break;
            case OpCode.INC:
                cpu.ALU.Accumulator += 1;
                break;
            case OpCode.DEC:
                cpu.ALU.Accumulator -= 1;
                break;
            case OpCode.JMP:
                var targetAddress = memory.Read(ProgramCounter);
                
                ProgramCounter = targetAddress;
                break;
            case OpCode.JZ:
                targetAddress = memory.Read(ProgramCounter);
                if (cpu.ALU.Accumulator == 0)
                    ProgramCounter = targetAddress;
                else
                    ProgramCounter += 1;

                break;
            default:
                Console.WriteLine($"Unsupported instruction: {instruction} -> HALT");
                return false;
        }

        return true;
    }
}

class ALU
{
    public int Accumulator { get; set; }

    public ALU()
    {
        Accumulator = 0;
    }

    public void Add(int b)
    {
        Accumulator += b;
    }

    public void Subtract(int b)
    {
        Accumulator -= b;
    }

    public void Compare(int b)
    {
        Accumulator = (Accumulator - b) == 0 ? 0 : 1;
    }
}

class CPU
{
    public ControlUnit ControlUnit { get; }
    public ALU ALU { get; }

    public CPU()
    {
        ControlUnit = new ControlUnit(true);
        ALU = new ALU();
    }

    public void Run(MainMemory memory, IODevice ioDevice)
    {
        var running = true;
        while (running)
        {
            ControlUnit.FetchInstruction(memory);
            running = ControlUnit.ExecuteInstruction(this, memory, ioDevice);
        }
    }
}

class MainMemory
{
    public int[] Memory { get; }

    public MainMemory(int size)
    {
        Memory = new int[size];
    }

    public int Read(int address)
    {
        return Memory[address];
    }

    public void Write(int address, int value)
    {
        Memory[address] = value;
    }
}

class IODevice
{
    public int InputData()
    {
        return 42;
    }

    public void OutputData(int data)
    {
        Console.WriteLine($"Output: {data}");
    }
}

class Computer
{
    public CPU Cpu { get; }
    public MainMemory Memory { get; }
    public IODevice IoDevice { get; }
    public Dictionary<string, int> Labels { get; }
    public int Offset { get; set; }

    public Computer(int memorySize, IODevice ioDevice)
    {
        Cpu = new CPU();
        Memory = new MainMemory(memorySize);
        IoDevice = ioDevice;
        Labels = new Dictionary<string, int>();
        Offset = 0;
    }

    public void LoadProgram(List<int> program)
    {
        for (var i = 0; i < program.Count; i++)
            Memory.Write(i, program[i]);

        Console.WriteLine("Program loaded into memory");
    }

    public void Run()
    {
        Console.WriteLine("Running program...");
        Cpu.Run(Memory, IoDevice);
    }
}

class Compiler
{
    private readonly Dictionary<string, int> _labels;

    private static readonly Regex LabelRegex = new Regex(@"\s*:\s*(\w+)");


    public Compiler()
    {
        _labels = new Dictionary<string, int>();
    }

    private static string RemoveComment(string line)
    {
        var commentIndex = line.IndexOf('#');

        return commentIndex != -1 ? line.Substring(0, commentIndex).Trim() : line.Trim();
    }

    private int ParseOperand(string token)
    {
        int operand;

        if (token.StartsWith("@"))
        {
            var label = token.Substring(1, token.Length - 1);
            if (_labels.ContainsKey(label))
                operand = _labels[label];
            else
                throw new NotSupportedException($"Label not found: {token}");
        }
        else
            try
            {
                operand = int.Parse(token);
            }
            catch
            {
                throw new NotSupportedException($"Unknown token: {token}");
            }

        return operand;
    }

    public List<int> Compile(string sourceCode)
    {
        var compiledProgram = new List<int>();
        var lines = sourceCode.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);

        // First pass - process labels
        var offset = 0;
        var index = 0;
        foreach (var line in lines)
        {
            var trimmedLine = RemoveComment(line);
            if (trimmedLine.Length == 0)
                continue;

            var match = LabelRegex.Match(trimmedLine);

            if (match.Success)
            {
                _labels.Add(match.Groups[1].Value, index - offset);
                offset++;
            }

            var tokens = trimmedLine.Split(' ', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
            index += tokens.Length;

        }

        // Second pass - compile instructions
        foreach (var line in lines)
        {
            var trimmedLine = RemoveComment(line);
            if (trimmedLine.Length == 0)
                continue;

            if (trimmedLine.StartsWith(':')) 
                continue;

            var operand = 0;
            var tokens = trimmedLine.Split(' ', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

            if (Enum.TryParse(tokens[0].ToUpper(), out OpCode opCode))
            {
                compiledProgram.Add((int)opCode);

                if (tokens.Length <= 1) 
                    continue;

                operand = ParseOperand(tokens[1]);
                compiledProgram.Add(operand);
            }
            else
            {
                // try to convert to a number
                operand = ParseOperand(tokens[0]);
                compiledProgram.Add(operand);
            }
        }

        DumpByteCode(compiledProgram);

        return compiledProgram;
    }

    private static void DumpByteCode(List<int> compiledProgram)
    {
        Console.WriteLine("Compiled byte-code:");

        var separator = "\n";
        for (var index = 0; index < compiledProgram.Count; index++)
        {
            Console.Write($"{index:X2}|");
            separator += "--|";
        }

        Console.WriteLine(separator);

        foreach (var op in compiledProgram)
            Console.Write($"{op:X2}|");

        Console.WriteLine("\n");
    }
}
```
