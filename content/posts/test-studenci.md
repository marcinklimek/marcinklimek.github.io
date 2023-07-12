---
title: "Test"
date: 2023-04-25T19:13:33+02:00
draft: true
ShowToc: false
---

### Rozpisać kolejne kroki konwersji na liczbę w notacji binarnej za pomocą metody z resztą:


    Przykład:
    liczba: 108
    
    108   : 2 = 54   (reszta: 0)
    54    : 2 = 27   (reszta: 0)
    27    : 2 = 13   (reszta: 1)
    13    : 2 = 6    (reszta: 1)
    6     : 2 = 3    (reszta: 0)
    3     : 2 = 1    (reszta: 1)
    1     : 2 = 0    (reszta: 1)


**Liczby do zamiany:**

    1. 91
    2. 2023


#### Zamiana na wartości szesnastkowe (grupami po 4 bity)


    Przykład:
    liczba: 46893

    1011 0111 0010 110
       B    7    2    D


**Liczby do zamiany:**

    1. 91
    2. 2023


### Przechowywanie danych 

**Ile bitów jest potrzebnych na zapisanie liczby ?**

    139 - 
    255 -  
    881 -  
    513 - 


### Rejestr
**Co to jest rejestr w procesorze?**

*Proszę zaznaczyć właściwe odpowiedzi*

    [ ] Obszar w pamięci RAM, który jest używany do przechowywania danych.
    [ ] Element, który przechowuje adresy pamięci dla instrukcji procesora.
    [ ] Komponent procesora odpowiedzialny za wykonywanie instrukcji.
    [ ] Specjalna jednostka pamięci przechowująca dane bezpośrednio w procesorze do szybkiego dostępu.
    [ ] Miejsce, gdzie procesor przechowuje swój stan.
    [ ] fizyczne miejsce do przechowywania danych na dysku twardym


### Nadmiar i niedomiar

- **Czy wynik operacji mieści się w 8-bitowym rejestrze? (nadmiar czy niedomiar)**
- **Ile bitów potrzeba do reprezentacji wyniku?**

1. Dodawanie:

        A = 139
        B = 255
        A + B = 

2. Dodawanie:

        A = 139
        B = 117
        A + B =

3. Odejmowanie:

        A = 881
        B = 513
        A - B = 


### Liczby ujemne

    Przykład:
     Zapisać liczbę -2 w 10-bitowym rejestrze, używamy kodu U2 (Uzupełnienie do 2):
    
        -2 = 1111111110

**Liczba do konwersji:**

    -19


### Notacja zmiennoprzecinkowa

**Z jakich elementów składa się liczba w notacji IEEE-754?**


### Kolejność bajtów

Liczba 1278471395 zapisana jest w pamięci w kolejnych komórkach w nastepujący sposób:

    4c 33 ec e3

**Jaka to jest kolejność bajtów?**


### Instrukcje

1. Co to są instrukcje SIMD?
2. Do czego służą?


### Architektura

1. Z jakich elmentów składa się architektura von Neumana? 
2. Czym różni się od niej architektura Harwardzka? 
3. Gdzie stosowana jest architektura Harwardzka?


### Cykl rozkazowy
*Proszę zaznaczyć właściwe odpowiedzi*

**Co to jest potok rozkazowy w kontekście architektury komputera?**

    [ ] Mechanizm operacyjny pozwalający na równoległe wykonanie wielu rozkazów
    [ ] Proces tworzenia oprogramowania
    [ ] Metoda przechowywania danych w komputerze
    [ ] Technika szyfrowania danych

**Który z poniższych stanowi główny cel potoku rozkazowego?**

    [ ] Zwiększenie przepustowości
    [ ] Zmniejszenie zużycia energii przez komputer
    [ ] Zwiększenie prędkości taktowania procesora
    [ ] Zwiększenie pojemności pamięci RAM

**Jakie jest zastosowanie potoku rozkazowego w architekturze komputera?**

    [ ] Rozdzielenie procesu na fazy
    [ ] Zwiększenie szybkości procesora
    [ ] Zarządzanie pamięcią komputera
    [ ] Wszystkie powyższe

**Jaki jest efekt potoku rozkazowego na wydajność systemu komputerowego?**

    [ ] Zwiększa wydajność poprzez równoległe wykonywanie instrukcji
    [ ] Zmniejsza wydajność poprzez zwiększanie złożoności obliczeń
    [ ] Nie wpływa na wydajność systemu komputerowego
    [ ] Zwiększa wydajność poprzez zwiększenie szybkości taktowania

**Która z poniższych jest wadą potoku rozkazowego?**

    [ ] Efekt Hazardu
    [ ] Zwiększenie szybkości procesora
    [ ] Zwiększenie przepustowości
    [ ] Równoległe wykonanie instrukcji

### Potok rozkazowy

1. Wymień rodzaje hazardów. 
2. Jak można je eliminować?
3. Maksymalnie skrótowo opisz hazard, jaki był symulowany w zadaniu lab_07 - część pierwsza (bez predyktora)
