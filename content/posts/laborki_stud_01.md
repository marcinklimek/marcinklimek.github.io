---
title: "Lab - whole"
date: 2023-04-24T17:13:33+02:00
draft: true
ShowToc: true

---

<!---
``` {=html}
<style>
body { min-width: 80% !important; }
</style>
```
-->

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
=====
1. Jeśli ktoś jest zainteresowany, proponuję włączyć kamerę - na tej podstawie sprawdzam obecność
2. Aktywność generuje plusy 
3. Wyniki, rezultaty z ćwiczeń proszę wklejać na czat
4. Zaliczenie przedmiotu - kolokwium lub projekt
    1. Jeśli kolokwium to odbędzie się na przedostatnich zajęciach (zakres ściśle powiązany ze skryptem)
    2. Jeśli projekt, to prezentacja na ostatnich zajęciach - najprawdopodobniej stworzenie symulatora, powiązanego z tematyką zajęć.
5. Zajęcia mają formułę warsztatów
    1. Trochę omawiamy temat
    2. Przeklejamy przykładowe programy lub programujemy je
6. W dowolnym momencie proszę pytać o cokolwiek co jest związane z tematyką zajęć

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

**Ćwiczenie**
- 110111
- 101001

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

    139
    255
    269
    513


### Co to jest rejestr?

### Nadmiar i niedomiar

**Ćwiczenie**

- Czy wynik operacji mieści się w 8-bitowym rejestrze? (nadmiar czy niedomiar)
- Ile bitów potrzeba do reprezentacji wyniku?

1. Dodawanie:

        A = 127
        B = 4
        A + B =

2. Dodawanie:

        A = 139
        B = 147
        A + B =

3. Odejmowanie:

        A = 115
        B = 5
        C = A - B =

4. Odejmowanie:

        A = 129
        B = 167
        C = A - B =

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
1. -19
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

#### Ćwiczenia

1. Liczba dziesiętna 0.5:
2. Liczba dziesiętna 0.25:
3. Liczba dziesiętna 0.625:
4. Liczba dziesiętna 0.375:
5. Liczba dziesiętna 0.1977:

>Warto zauważyć, że niektóre liczby ułamkowe w systemie dziesiętnym nie mają dokładnej reprezentacji w systemie binarnym.

6. Liczba dziesiętna 0.1:

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
2. Zmierz czas wykonania każdej operacji za pomocą biblioteki <chrono>.
3. Wyświetl wyniki w formie tabeli, porównując czas wykonania operacji dla liczby stało- i zmiennoprzecinkowej.


**Lab_02:**



## Analiza wpływu precyzji zmiennoprzecinkowej na czas wykonywania operacji.

1. Utwórz program, który wykonuje operacje matematyczne na liczbach zmiennoprzecinkowych o różnych precyzjach (float, double, long double).
2. Zmierz czas wykonania każdej operacji dla różnych precyzji.
3. Porównaj wyniki i zastanów się nad wpływem precyzji na czas wykonania operacji.

**Lab_03:**


Ten program w C++ analizuje wpływ precyzji zmiennoprzecinkowej na czas wykonania operacji. Wykonuje on podstawowe operacje matematyczne (`+`, `-`, `*`, `/`) na liczbach zmiennoprzecinkowych o różnych precyzjach (`float`, `double`, `long double`) i mierzy czas wykonania tych operacji za pomocą biblioteki `<chrono>`.

Po skompilowaniu i uruchomieniu programu, na konsoli zostaną wyświetlone wyniki czasu wykonania operacji dla różnych precyzji. Należy przeanalizować wyniki i zastanowić się nad wpływem precyzji na czas wykonania operacji.

## Obliczanie czasu wykonywania operacji na macierzach stało- i zmiennoprzecinkowych.

1. Napisz program, który mnoży dwie macierze o ustalonych rozmiarach, używając typów stałoprzecinkowych (int) oraz zmiennoprzecinkowych (float, double).
2. Zmierz czas wykonania mnożenia macierzy dla różnych rozmiarów macierzy.
3. Porównaj wyniki i omów znaczenie różnic w czasie wykonania dla różnych typów danych.

**Lab_04:**


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
