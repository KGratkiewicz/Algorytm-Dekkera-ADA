# Algorytm Dekkera ADA
Program pokazujący implementacje oraz działanie algorytmu Dekkera przy użyciu języka [ADA](https://pl.wikipedia.org/wiki/Ada_(j%C4%99zyk_programowania)). 

Plik projektowy ze środowiska [GNAT Studio | Adacore](https://www.adacore.com/gnatpro/toolsuite/gnatstudio).

## Algorytm Dekkera
Algortym Dekkera rozwiązuje problem wzajemnego wykluczania, czyli zapewnia własność bezpieczeństwa [programu współbieżnego](https://pl.wikipedia.org/wiki/Przetwarzanie_wsp%C3%B3%C5%82bie%C5%BCne).

### Problem wzajemnego wykluczania
Problem wzajemnego wykluczania występuje wtedy kiedy conajmniej dwa procesy, chcą skorzystać z zasobu współdzielonego. Muszą one jednak skorzystać z niego jeden po drugim, aby nie "wtrącać się" jeden drugiemu. Dostęp do takiego zasobu współdzielonego nazywa się sekcją krytyczną procesu. W naszym przypadku zasobem współdzielonym jest ekran konsoli.

## Treść zadania
Ćwiczenie 3 - Utworzyć 2 zadania tego samego typu zadaniowego wypisujące na ekranie w 2 kolumnach po 10 razy: _"Zadanie nr po raz k"_ gdzie k- aktualna iteracja, nr - numer zadania. Wprowadzić przerwy pomiędzy interacjami o losowej długości.

## Działanie programu
Program swoją *sekcję lokalną* symuluje poprzez wykonanie opóźnienia `delay` o losowym czasie trwania. W *sekcji krytycznej* program jest dopuszczany do wykonania wypisania na ekranie. W przypadku niezastosowania synchronizacji dostępu do ekranu konsoli, możemy otrzymać wypisane ciągi procesu P1 wraz z ciągiem procesu P2.

### Output działania programu
```
                      Zadanie  2 po raz  1
Zadanie  1 po raz  1
Zadanie  1 po raz  2  Zadanie  2 po raz  2
Zadanie  1 po raz  3
Zadanie  1 po raz  4  Zadanie  2 po raz  3
                      Zadanie  2 po raz  4
                      Zadanie  2 po raz  5
Zadanie  1 po raz  5  Zadanie  2 po raz  6
Zadanie  1 po raz  6  Zadanie  2 po raz  7
                      Zadanie  2 po raz  8
Zadanie  1 po raz  7  Zadanie  2 po raz  9
Zadanie  1 po raz  8  Zadanie  2 po raz 10
Zadanie  1 po raz  9
Zadanie  1 po raz 10
```

### Możliwy output bez synchronizacji dostępu 
```
                      Zadanie  2 po raz  1
Zadanie  1 po raz  1
Zadanie               Zadanie   1 po raz  22 po raz  2
Zadanie  1 po raz  3
Zadanie               Zadanie  21 po po raz  3raz  4
                      Zadanie  2 po raz  4
                      Zadanie  2 po raz  5
                      Zadanie  Zadanie  1 po raz  52 po raz  6
                      ZadanieZadanie  1  2 popo raz  6 raz  7
                      Zadanie  2 po raz  8
Zadanie  1 po raz  7  Zadanie  2 po raz  9
Zadanie  1 po raz     Zadanie  2 po raz 108
Zadanie  1 po raz  9
Zadanie  1 po raz 10
```

### Kod żródłowy 

lokalizajca:

[src/main.adb](/src/main.adb) - plik główny main

[src/RandomPackage.ads](/src/RandomPackage.ads) - pakiet RandomPackage

[src/RandomPackage.adb](/src/RandomPackage.adb) - pakiet RandomPackage - ciało


---
&copy; Jakub Grątkiewicz
