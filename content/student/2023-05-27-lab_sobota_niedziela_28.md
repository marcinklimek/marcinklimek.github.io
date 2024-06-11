---
title: Zadania
date: 2023-04-25T18:13:33+02:00
draft: true
ShowToc: false
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---


**Lab_06:**


Ćwiczenie:
1. Proszę uruchomić pierwszy program
```$lab_06_a.exe```
2. Proszę opisać kolejne cykle rozkazowe, jakie wykonuje procesor.
3. Należy zamieścić wynik działania programu w sprawozdaniu.

```
memory = [10, 6, 7, 2, 1, 0, 0]
instructions = [
    ("LOAD",  0, 0),
    ("LOAD",  1, 2),
    ("ADD",   0, 1),
    ("STORE", 0, 0),
]
```

4. Proszę uruchomić drugi program
```$lab_06_b.exe```
5. Należy zamieścić wynik działania programu w sprawozdaniu.

```
memory = [10, 6, 7, 2, 1, 0, 0]
instructions = [
    ("LOAD",  0, 0),
    ("LOAD",  1, 2),
    ("ADD",   0, 1),
    ("STORE", 0, 0),

    ("LOAD",  3, 1),
    ("LOAD",  2, 3),
    ("SUB",   3, 2),
    ("STORE", 1, 3),

    ("JNZERO", 3, -9),
]
```


**Lab_07**
1. Bez włączonej predykcji

Proszę uruchomić każdy z programów. 
```
lab_07.exe <num_pipelines> <use_predictor> <test_program>
             <1-12>          <True/False>       <1-3>
```

Na przykład:
```$ lab_07.exe 4 false 1   -> Uruchomienie programu testowego nr 1, bez predyktora, z 4 potokami```

W sprawozdaniu:

- Ile cykli wykonywał się każdy program? 
- Dlaczego wystąpił pierwszy stall w każdym z programów? 

Kolejno należy zmieniać ilość dostępnych potoków, od 1 do 5. Proszę opisać jak zmieniał się czas wykonania (ilość cykli). Z czego to może wynikać. 
Dla każdego przypadku proszę podać końcową zawartość pamięci. Na przykład:

```
Memory:
4, 0, 4, 0, 4, 7, 3, 2, 9, 7, 1, 1
```

1. Z włączoną predykcją


Na przykład:
```$ lab_07.exe 4 true 1   -> Uruchomienie programu testowego nr 1, bez predyktora, z 4 potokami```

W sprawozdaniu:

- Ile cykli wykonywał się każdy program?
- Dlaczego wystąpił pierwszy stall w każdym z programów?

Kolejno należy zmieniać ilość dostępnych potoków, od 1 do 5. Proszę opisać jak zmieniał się czas wykonania (ilość cykli). Z czego to może wynikać. 

Proszę wypisać wystapienia komunikatu: Instruction under this address can generate branch. Z czego wynika ten komunikat?


**Instruction reordering**

Proszę uruchomić program, opisać w sprawozdaniu jego wynik. Z czego wynika takie działanie programu? Należy przerwać wykonywanie zaraz po pojawieniu się pierwszych wyników.

```$lab_10.exe```


**Lab_11 - Lab_12 - Lab_13**

1. Proszę uruchomić kolejno lab_11, lab_12, lab_13
2. W sprawozdaniu proszę umieścić wynik działania programów
3. Proszę zinterpretować wyniki.

Lab_11  - program sekwencyjny
Lab_12a - podobny problem do lab_11, ale wielowątkowo
Lab_12b - podobny problem do lab_11, ale wielowątkowo, z rozwiązaniem problemu
Lab_13  - symulacja technologii HT

**Lab_15**

W poniższym programie przetestujemy dwa różne sposoby dostępu do pamięci: sekwencyjny i losowy. Porównamy czas wykonania obu podejść, które mogą wpływać na wykorzystanie pamięci cache.

Proszę uruchomić program, opisać w sprawozdaniu jego wynik.
```
$lab_15.exe <iterations> <seq/random>
              <50-1000>    <seq/random>
```

Należy modyfikować ilość iteracji: 50 75 100, uruchamiając dla dostępu sekwencyjnego i losowego.


**Lab_17**

Proszę uruchomić program, opisać w sprawozdaniu jego wynik. Należy kilka razy zmodyfikować parametry:

- ```-c 1024 -b 32 -n 10000 -m 2048```
- ```-c 1024 -b 64 -n 10000 -m 2048```
- ```-c 2048 -b 32 -n 10000 -m 4096```
- ```-c 2048 -b 64 -n 10000 -m 4096```
- inna konfiguracja wg uznania z taką samą liczbą iteracji
- inna konfiguracja wg uznania z taką samą liczbą iteracji

```
$lab_17.exe -c 1024 -b 32 -n 10000 -m 1024

  -c, --cache size
  -b, --block size
  -n, --iteration
  -m, --memory size
```


**Lab_18** - Prefetch


Proszę uruchomić program, opisać w sprawozdaniu jego wynik. Należy kilka razy zmodyfikować parametry:

- ```-c 1024 -b 32 -n 10000 -m 2048 -d 1```
- ```-c 1024 -b 64 -n 10000 -m 2048 -d 2```
- ```-c 2048 -b 32 -n 10000 -m 4096 -d 4```
- ```-c 2048 -b 64 -n 10000 -m 4096 -d 8```
- inna konfiguracja wg uznania z taką samą liczbą iteracji
- inna konfiguracja wg uznania z taką samą liczbą iteracji

```
$lab_18.exe -c 1024 -b 32 -n 10000 -m 1024 -d 8

  -c, --cache size
  -b, --block size
  -n, --iteration
  -m, --memory size
  -d, --prefetch distance
```


**Scenariusz problemu (architektura jednordzeniowa/wielordzeniowa)**

Przyjmijmy, że chcemy obliczyć wartości silni dla dużego zestawu liczb. Obliczenia te mają być wykonane sekwencyjnie dla każdej liczby w zestawie. Wartości silni obliczane są za pomocą iteracyjnej funkcji silni.

Porównanie rozwiązań na procesorze jedno- i wielordzeniowym:

1. Procesor jednordzeniowy:

< Jak mogą wyglądać obliczenia? Jak mogą być przydzielane zasoby procesora? Wątki?>

Zalety:
-
-

Wady:
- 
- 

2. Procesor wielordzeniowy:

< Jak mogą wyglądać obliczenia? Jak mogą być przydzielane zasoby procesora? >

Zalety:
- 
- 

Wady:
- 
- 

Porównanie:

Które rozwiązanie będzie wydajniejsze i w jakim wypadku? 
W jakich sytuacjach jedno rozwiązanie jest wydajniejsze od drugiego?
