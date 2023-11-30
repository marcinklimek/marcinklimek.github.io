---
title: "Systemy Operacyjne - Pomoc"
date: 2023-11-30T22:59:12+01:00
draft: false
ShowToc: true
---

# Help

## Sudoers add to

1. **Log in as root**: You need to have root access to edit the sudoers file. If you're not already logged in as root, you can switch to the root user by typing `su -` and entering the root password.

2. **Edit the sudoers file**: The recommended way to edit the sudoers file is by using the `visudo` command. This command opens the sudoers file in a text editor and performs syntax checking on save, reducing the risk of breaking the file with incorrect syntax. Enter the command `visudo` in the terminal.

3. **Add marcin to sudoers**: In the editor, look for a line that looks like this: `root ALL=(ALL:ALL) ALL`. Below this line, add a new line for 'marcin' with the same format: `marcin ALL=(ALL:ALL) ALL`. This line means that 'marcin' can execute any command as any user.

4. **Save and exit**: After adding the line, save the file and exit the editor. In most cases, `visudo` uses the nano editor, so you can save by pressing `Ctrl + O` and exit by pressing `Ctrl + X`.

5. **Test sudo access**: Switch back to the 'marcin' user account and try running a command with `sudo` to see if it works. For example, try `sudo apt update`.

Remember, it's important to be cautious when granting sudo privileges, as it gives the user significant control over the system. Make sure that 'marcin' is a trusted user who needs these privileges for legitimate reasons.


## Linki

Linki symboliczne (soft links) i twarde linki (hard links) to dwie metody tworzenia odniesień do plików w systemach Unix i Linux. Oba typy linków służą do tworzenia skrótów do plików, ale różnią się w kilku kluczowych aspektach:

1. **Definicja**:
   - **Twarde linki (Hard Links)**: Twardy link to dodatkowa nazwa dla istniejącego pliku. W systemie plików, zarówno twardy link, jak i oryginalny plik wskazują na tę samą lokalizację danych na dysku. Twarde linki działają tylko w obrębie tego samego systemu plików.
   - **Linki symboliczne (Soft/Symbolic Links)**: Link symboliczny to specjalny rodzaj pliku, który wskazuje na inny plik lub katalog poprzez ścieżkę. Link symboliczny jest oddzielnym plikiem i zawiera jedynie odniesienie (ścieżkę) do docelowego pliku lub katalogu.

2. **Zachowanie przy usunięciu oryginalnego pliku**:
   - **Twarde linki**: Jeśli oryginalny plik zostanie usunięty, twardy link nadal działa i zapewnia dostęp do zawartości pliku, ponieważ wskazuje na te same dane na dysku.
   - **Linki symboliczne**: Jeśli oryginalny plik zostanie usunięty, link symboliczny stanie się nieaktywny ("zepsuty") i nie będzie mógł zapewnić dostępu do usuniętych danych.

3. **Przechodzenie przez systemy plików**:
   - **Twarde linki**: Nie mogą być tworzone między różnymi systemami plików, ponieważ bezpośrednio wskazują na konkretne miejsce na dysku.
   - **Linki symboliczne**: Mogą wskazywać na pliki i katalogi w różnych systemach plików.

4. **Zajmowane miejsce**:
   - **Twarde linki**: Nie zajmują dodatkowego miejsca na dysku, ponieważ są tylko dodatkowym wpisem w tabeli inodów systemu plików.
   - **Linki symboliczne**: Zajmują niewielką ilość miejsca na dysku, ponieważ są osobnymi plikami zawierającymi ścieżkę do celu.

5. **Widoczność zmian**:
   - **Twarde linki**: Każda zmiana w pliku jest od razu widoczna we wszystkich twardych linkach, ponieważ wskazują one na te same dane.
   - **Linki symboliczne**: Zmiany w oryginalnym pliku są widoczne poprzez link, ale zmiana nazwy lub usunięcie oryginalnego pliku spowoduje, że link symboliczny stanie się nieaktywny.

W praktyce, linki symboliczne są bardziej elastyczne i powszechnie stosowane, zwłaszcza kiedy potrzebna jest odniesienie do katalogów lub plików na różnych systemach plików. Twarde linki są używane rzadziej, głównie z powodu ich ograniczeń i sposobu, w jaki działają na poziomie systemu plików.



Typowy przykład użycia twardych linków w systemach Linux i Unix to tworzenie dodatkowych odniesień do plików bez konieczności duplikowania ich zawartości. Jednym z konkretnych zastosowań twardych linków jest system zarządzania kopiami zapasowymi, takich jak metoda używana przez narzędzie `rsnapshot`.

**Przykład z użyciem `rsnapshot` lub podobnych narzędzi do tworzenia kopii zapasowych:**

W systemach kopii zapasowych, które wykorzystują twarde linki, kopie zapasowe są tworzone w taki sposób, że przy każdym nowym backupie, pliki, które nie uległy zmianie od ostatniej kopii, są reprezentowane przez twarde linki do wcześniej zbackupowanych plików, a nie przez ich pełne kopie. Oto jak to działa:

1. **Pierwszy Backup**: W trakcie pierwszego backupu, wszystkie pliki są fizycznie kopiowane do lokalizacji backupu.

2. **Kolejne Backupy**: W trakcie kolejnych backupów, tylko pliki, które uległy zmianie od ostatniego backupu, są kopiowane. Pliki, które nie uległy zmianie, są reprezentowane przez twarde linki do wcześniej zapisanych plików.

Korzyści z tego podejścia:

- **Oszczędność Miejsca**: Ponieważ niezmienione pliki nie są kopiowane wielokrotnie, a jedynie tworzone są ich twarde linki, oszczędza się znaczną ilość miejsca na dysku.
- **Efektywność**: Twarde linki są tworzone znacznie szybciej niż kopiowanie całych plików, co sprawia, że proces backupu jest szybszy.
- **Prostota Zarządzania**: Każda kopia backupu wygląda jak kompletny zestaw danych, mimo że większość plików jest współdzielona między różnymi backupami.

To podejście sprawdza się szczególnie w przypadku, gdy wiele plików pozostaje niezmienionych między kolejnymi backupami, co jest typowe dla większości systemów i użytkowników. Twarde linki w tej sytuacji pozwalają na efektywne i ekonomiczne zarządzanie przestrzenią dyskową bez utraty informacji o historii zmian plików.


## Katalogi

W systemach operacyjnych opartych na Unixie, takich jak Linux, istnieje szereg standardowych katalogów, z których każdy pełni określoną funkcję. Oto charakterystyczne cechy najważniejszych z nich:

1. **`/` (Root)**: To jest katalog główny, korzeń całego systemu plików. Wszystkie inne katalogi są zamontowane bezpośrednio lub pośrednio w tym katalogu.

2. **`/bin` (Binary)**: Zawiera podstawowe programy (binaria) używane przez wszystkich użytkowników systemu, takie jak powłoka (shell), cp, mv, rm, cat itp.

3. **`/boot`**: Zawiera pliki niezbędne do rozruchu systemu, w tym kernel (jądro systemu) i bootloader, np. GRUB.

4. **`/dev` (Devices)**: Zawiera pliki specjalne, które reprezentują urządzenia, zarówno blokowe, jak i znakowe, np. dyski twarde, terminaly.

5. **`/etc`**: Zawiera konfiguracje systemowe specyficzne dla danej maszyny, czyli skrypty startowe systemu, pliki konfiguracyjne usług/systemów.

6. **`/home`**: Domyślny katalog dla danych użytkowników. Każdy zarejestrowany użytkownik posiada tu swój podkatalog.

7. **`/lib` (Library)**: Zawiera biblioteki współdzielone i moduły jądra niezbędne do uruchomienia systemu i programów w katalogu `/bin` oraz `/sbin`.

8. **`/media`**: Miejsce do montowania zewnętrznych nośników danych, takich jak dyski USB, CD-ROMy.

9. **`/mnt` (Mount)**: Tradycyjnie używany do tymczasowego montowania systemów plików, chociaż w nowszych dystrybucjach częściej używa się `/media`.

10. **`/opt` (Optional)**: Przeznaczony dla dodatkowego oprogramowania i aplikacji (często tych zainstalowanych z zewnątrz standardowego systemu zarządzania pakietami).

11. **`/proc`**: Wirtualny system plików, który udostępnia interfejs do struktur danych jądra. Nie jest przechowywany na dysku, lecz tworzony w czasie działania systemu.

12. **`/root`**: Katalog domowy użytkownika root (superużytkownika), zazwyczaj nie umieszczony w `/home`, aby zapewnić bezpieczeństwo.

13. **`/sbin` (System Binary)**: Zawiera ważne programy do administracji systemem, które są zwykle potrzebne do uruchamiania, naprawy lub odzyskiwania systemu.

14. **`/srv` (Service)**: Zawiera dane związane z usługami serwerowymi uruchamianymi na systemie.

15. **`/tmp` (Temporary)**: Przechowuje pliki tymczasowe tworzone przez aplikacje i system. Zawartość tego katalogu jest często czyszczona przy uruchomieniu systemu.

16. **`/usr` (Unix System Resources)**: Druga, po `/`, największa hierarchia, zawierająca większość aplikacji i narzędzi użytkownika, bibliotek, dokumentacji itp.

17. **`/var` (Variable)**: Zawiera zmienne dane, takie jak logi, bazy danych, pliki spoolowe i pliki tymczasowe, które mogą rosnąć w czasie.

Każdy z tych katalogów odgrywa ważną rolę w organizacji i funkcjonowaniu systemu operacyjnego i jest integralną częścią jego struktury.


## zamkniecie maszyny

W systemach operacyjnych typu Unix, takich jak Linux, polecenia `shutdown -r now` i `systemctl reboot` są używane do restartowania systemu, ale istnieją między nimi pewne różnice, zarówno pod względem ich działania, jak i zachowania systemu:

1. **`shutdown -r now`**:
   - Polecenie `shutdown` jest tradycyjnym narzędziem Unix do zamykania lub restartowania systemu. 
   - Parametr `-r` oznacza restart (reboot), a `now` określa, że ma to nastąpić natychmiast.
   - `shutdown` stopniowo zamyka system, zamykając wszystkie procesy, wysyłając powiadomienia do zalogowanych użytkowników i synchronizując dyski przed restartem.
   - `shutdown` zapewnia bezpieczne wyłączanie systemu, co jest szczególnie ważne w środowiskach serwerowych lub w przypadku wielu użytkowników.

2. **`systemctl reboot`**:
   - `systemctl` to narzędzie do zarządzania systemem i usługami w systemd, który jest obecnie standardowym systemem inicjującym w wielu dystrybucjach Linux.
   - Polecenie `systemctl reboot` natychmiast inicjuje restart systemu, bez wysyłania dodatkowych powiadomień do zalogowanych użytkowników.
   - Jest to bardziej bezpośrednie polecenie do restartowania systemu i jest częścią nowszej filozofii zarządzania systemami opartą na systemd.
   - Podobnie jak `shutdown`, `systemctl reboot` także dba o bezpieczne zamknięcie systemu, zamykając procesy i synchronizując dyski.

**Podsumowanie**:
- Główna różnica polega na tym, że `shutdown -r now` jest bardziej "łagodne" i tradycyjne, zapewniając pewne powiadomienia i stopniowe zamykanie systemu, podczas gdy `systemctl reboot` jest częścią nowszego systemd i działa nieco szybciej i bezpośredniej.
- Oba polecenia są bezpieczne do użytku i osiągają ten sam cel – restartują system, ale różnią się sposobem, w jaki informują użytkowników i zamykają bieżące procesy.


Dowiązanie symboliczne:

`lrwxrwxrwx 1 root root 14 Sep 20 14:15 /usr/sbin/reboot -> /bin/systemctl`



## systemctl 


`systemctl` to narzędzie do zarządzania systemem i usługami w systemd, które jest standardowym systemem inicjującym i menedżerem systemu i usług w wielu nowoczesnych dystrybucjach Linuxa. Oto lista typowych poleceń, które są używane z `systemctl`:

1. **Zarządzanie Stanem Systemu**
   - `systemctl reboot`: Restartuje system.
   - `systemctl poweroff`: Wyłącza system.
   - `systemctl suspend`: Zawiesza system.
   - `systemctl hibernate`: Hibernuje system.
   - `systemctl hybrid-sleep`: Przechodzi w stan uśpienia hybrydowego (połączenie hibernacji i uśpienia).

2. **Zarządzanie Usługami**
   - `systemctl start [nazwa_usługi]`: Uruchamia daną usługę.
   - `systemctl stop [nazwa_usługi]`: Zatrzymuje daną usługę.
   - `systemctl restart [nazwa_usługi]`: Restartuje daną usługę.
   - `systemctl reload [nazwa_usługi]`: Przeładowuje konfigurację danej usługi bez zatrzymywania jej.
   - `systemctl enable [nazwa_usługi]`: Włącza usługę, aby uruchamiała się przy starcie systemu.
   - `systemctl disable [nazwa_usługi]`: Wyłącza usługę z automatycznego uruchamiania przy starcie systemu.
   - `systemctl status [nazwa_usługi]`: Wyświetla aktualny stan danej usługi.

3. **Zarządzanie Celami (Targets)**
   - `systemctl isolate [nazwa_celu]`: Przełącza system do określonego celu (np. graphical.target).
   - `systemctl set-default [nazwa_celu]`: Ustawia domyślny cel, do którego system będzie uruchamiany.

4. **Diagnostyka i Logi**
   - `systemctl list-units`: Wyświetla wszystkie aktywne jednostki (usługi, gniazda, timery itp.).
   - `systemctl list-unit-files`: Wyświetla listę wszystkich jednostek wraz z ich aktualnym stanem włączenia.
   - `systemctl daemon-reload`: Odświeża konfigurację systemd po zmianach w plikach jednostek.
   - `systemctl cat [nazwa_usługi]`: Wyświetla zawartość pliku konfiguracyjnego danej usługi.

5. **Zarządzanie Gniazdami i Timerami**
   - `systemctl list-sockets`: Wyświetla aktywne gniazda.
   - `systemctl list-timers`: Wyświetla aktywne timery.

`systemctl` jest potężnym narzędziem, które pozwala na zaawansowane zarządzanie różnymi aspektami systemu i usług w systemach Linux korzystających z systemd. Powyższe polecenia to tylko podstawowe operacje, które można wykonać za pomocą tego narzędzia.


### Jak naprawić problem z "vboxadd.serice loaded failed"


Komunikat "vboxadd.service loaded failed failed", który widzisz w wyniku polecenia `systemctl list-units`, wskazuje na problem z usługą `vboxadd`, która jest częścią VirtualBox Guest Additions. VirtualBox Guest Additions to zestaw narzędzi i sterowników zaprojektowanych, aby poprawić wydajność i użyteczność systemów operacyjnych gości w VirtualBox.

Oto kroki, które można podjąć, aby rozwiązać ten problem:

1. **Sprawdzenie Stanu Usługi**: Najpierw sprawdź dokładny status usługi i wszelkie komunikaty o błędach:
   
   ```bash
   systemctl status vboxadd.service
   ```
   
   Uważnie przeczytaj wyjście tego polecenia, aby zrozumieć, dlaczego usługa nie uruchamia się poprawnie.

2. **Ponowne Uruchomienie Usługi**: Spróbuj ręcznie uruchomić usługę, aby zobaczyć, czy to rozwiąże problem:

   ```bash
   sudo systemctl restart vboxadd.service
   ```

   Następnie sprawdź, czy usługa uruchomiła się poprawnie:

   ```bash
   systemctl status vboxadd.service
   ```

3. **Reinstalacja VirtualBox Guest Additions**: Jeśli problem nadal występuje, możliwe, że należy przeinstalować VirtualBox Guest Additions. To można zrobić z poziomu systemu gościa. W zależności od dystrybucji, kroki mogą się nieco różnić. Typowo, należy zamontować obraz Guest Additions i uruchomić skrypt instalacyjny:

   - W VirtualBox, włącz maszynę wirtualną i wybierz "Devices" > "Insert Guest Additions CD image...".
   - W systemie gościa, zamontuj CD i uruchom skrypt instalacyjny.

4. **Aktualizacja VirtualBox**: Upewnij się, że Twoja wersja VirtualBox na hoście jest aktualna. Stare wersje mogą powodować problemy z kompatybilnością.

5. **Sprawdzenie Logów Systemowych**: Dodatkowe informacje mogą znajdować się w logach systemowych. Możesz je sprawdzić za pomocą polecenia:

   ```bash
   journalctl -xe
   ```

   Szukaj wpisów związanych z `vboxadd.service`.

##  Skrót na klawiaturze do terminala w XFCE

W środowisku graficznym XFCE, domyślnym skrótem klawiaturowym do uruchomienia terminala jest zwykle `Ctrl` + `Alt` + `T`. Jednakże, warto zauważyć, że ten skrót może być różny w zależności od dystrybucji i tego, czy zostały dokonane jakieś indywidualne modyfikacje w ustawieniach skrótów klawiszowych.

Jeśli ten skrót nie działa w twoim systemie Debian z XFCE, możesz go ustawić lub sprawdzić, jaki jest aktualny skrót, wykonując następujące kroki:

1. Otwórz **Ustawienia** XFCE.
2. Przejdź do sekcji **Klawiatura**.
3. Wybierz zakładkę **Skróty aplikacji**.
4. Znajdź lub dodaj nowy skrót dla terminala. Zazwyczaj poleceń uruchamiających terminal to `xfce4-terminal` lub po prostu `terminal`.

Jeśli nie widzisz tam skrótu `Ctrl` + `Alt` + `T` dla terminala, możesz go dodać ręcznie:

- Kliknij **Dodaj**.
- Wprowadź `xfce4-terminal` jako polecenie.
- Naciśnij kombinację `Ctrl` + `Alt` + `T` (lub inną według preferencji), gdy zostaniesz poproszony o wskazanie skrótu klawiszowego.




# Wirtualizacja

## Kubernetes
Kubernetes, często skracane do "K8s", to otwartoźródłowy system do automatyzacji wdrażania, skalowania i zarządzania aplikacjami kontenerowymi. Jest to narzędzie stworzone przez Google, które stało się standardem w świecie zarządzania kontenerami. Oto kilka kluczowych cech charakterystycznych Kubernetes:

1. **Orkiestracja Kontenerów**: Kubernetes umożliwia uruchamianie i zarządzanie kontenerami na dużą skalę. Kontenery mogą być wdrażane, skalowane i zarządzane w sposób zautomatyzowany.

2. **Abstrakcja od Infrastruktury**: Kubernetes abstrahuje infrastrukturę sprzętową od aplikacji, co pozwala na łatwe przenoszenie aplikacji między różnymi środowiskami, od lokalnych do chmur publicznych.

3. **Samonaprawialność**: System może automatycznie restartować kontenery, które przestały działać, zastępować kontenery, wykrywać i nie używać maszyn, które nie odpowiadają na zapytania, oraz skalować aplikacje w oparciu o zapotrzebowanie.

4. **Skalowalność i Łatwość Zarządzania**: Kubernetes umożliwia łatwe skalowanie aplikacji w górę lub w dół, automatycznie lub manualnie, oraz sprawia, że zarządzanie aplikacjami jest bardziej efektywne.

5. **Usługi Dostępności i Balansowanie Obciążenia**: Kubernetes może eksponować kontener na określony adres IP lub nazwę hosta. Jeśli ruch do kontenera jest duży, Kubernetes potrafi balansować obciążenie i dystrybuować ruch sieciowy, aby zapewnić stabilność działania aplikacji.

6. **Zarządzanie Konfiguracją i Sekretami**: Umożliwia zarządzanie konfiguracją i sekretami, co jest kluczowe w przypadku aplikacji wymagających bezpiecznego przechowywania i zarządzania poufnymi danymi.

7. **Automatyczne Rozwijanie i Wycofywanie Zmian**: Kubernetes umożliwia automatyczne rozwijanie i wycofywanie zmian, co jest szczególnie przydatne w procesach ciągłej integracji i ciągłego wdrażania (CI/CD).

8. **Deklaratywne Konfiguracje**: Kubernetes wykorzystuje deklaratywne konfiguracje do zarządzania aplikacjami, co ułatwia utrzymanie i aktualizowanie stanu pożądanego dla wdrożeń.

9. **Wsparcie Społeczności i Ekosystemu**: Jako projekt prowadzony przez Cloud Native Computing Foundation (CNCF), Kubernetes cieszy się silnym wsparciem społeczności i rozbudowanym ekosystemem narzędzi i dodatków.

10. **Wszechstronność**: Kubernetes jest odpowiedni zarówno dla małych, jak i dużych, rozbudowanych aplikacji, dzięki swojej modułowości i możliwości dostosowania do różnych wymagań.

Kubernetes znacząco wpłynął na sposób, w jaki organizacje wdrażają i zarządzają aplikacjami, szczególnie w środowiskach chmurowych i w kontekście mikrousług.



# apt sources

      deb https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware
      # deb-src https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware

      deb https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware
      # deb-src https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware

      deb https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware
      # deb-src https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware

      deb https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware
      # deb-src https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware

      deb https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware
      # deb-src https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware 

# Wybrane polecenia systemu

## Finger

Polecenie `finger` służy do wyświetlania informacji o użytkownikach w systemach Unix i Unix-podobnych. Dostarcza informacji takich jak login użytkownika, nazwa, biuro, numer telefonu, adres e-mail oraz czas ostatniego logowania. Może również pokazać, czy użytkownik jest aktualnie zalogowany i od jakiego czasu, jak również zawartość pliku `.plan` użytkownika, który często zawiera informacje o jego aktualnych zajęciach lub planach.

Co do dostępności `finger` w Debianie 12 (nazwanym "Bookworm" w momencie pisania tego tekstu), trzeba pamiętać, że różne dystrybucje Linuxa mogą lub nie zawierać `finger` w swoich standardowych repozytoriach. Jednakże, `finger` jest często dostępny w większości dystrybucji i można go zainstalować z repozytorium, jeśli nie jest zainstalowany domyślnie.

Aby sprawdzić, czy `finger` jest dostępny w Twojej dystrybucji Debiana oraz zainstalować go, możesz użyć następujących poleceń:

1. Sprawdź, czy `finger` jest dostępny:
   ```bash
   apt-cache search ^finger
   ```

2. Jeśli jest dostępny, zainstaluj go za pomocą:
   ```bash
   sudo apt-get install finger
   ```

Warto zauważyć, że z powodu zagrożeń bezpieczeństwa związanych z ujawnianiem informacji o użytkownikach, wiele systemów i administratorów rezygnuje z korzystania z `finger`. Należy więc używać go z rozwagą, zwłaszcza w środowiskach produkcyjnych.


## wiadomości wysyłane za pomocą polecenia `write`

Aby móc odbierać wiadomości wysyłane za pomocą polecenia `write` w systemie Debian, należy upewnić się, że kilka warunków jest spełnionych:

1. **Uruchomione Usługi**:
   - Upewnij się, że usługi odpowiedzialne za obsługę wiadomości, takie jak `write`, `talk`, itp., są aktywne na systemie.

2. **Sprawdzenie Stanu `mesg`**:
   - Polecenie `write` używa TTY (terminala) użytkownika do wysyłania wiadomości. Aby móc odbierać wiadomości, użytkownik musi mieć włączoną opcję odbioru wiadomości na swoim TTY. Można to sprawdzić, wpisując polecenie `mesg`.
   - Jeśli wynik to `is y`, oznacza to, że odbiór wiadomości jest włączony. Jeśli wynik to `is n`, odbiór wiadomości jest wyłączony.
   - Aby włączyć odbiór wiadomości, wpisz `mesg y`.

3. **Zezwolenie na Wiadomości od Innych Użytkowników**:
   - Jeśli masz włączone środowisko graficzne, może być konieczne sprawdzenie ustawień prywatności w swoim menedżerze okien lub środowisku pulpitu, aby upewnić się, że zezwala ono na odbiór wiadomości od innych użytkowników.

4. **Sprawdzenie Polityki Bezpieczeństwa**:
   - W niektórych środowiskach zaostrzone polityki bezpieczeństwa mogą blokować komunikację między użytkownikami za pomocą poleceń takich jak `write`. Upewnij się, że taka komunikacja jest dozwolona w ramach polityk bezpieczeństwa systemu.

5. **Sprawdzenie Zapory Sieciowej i SELinux**:
   - Jeśli na systemie działają zaawansowane mechanizmy bezpieczeństwa, takie jak zapora sieciowa lub SELinux, mogą one wpływać na możliwość korzystania z poleceń takich jak `write`. Upewnij się, że nie blokują one tego rodzaju komunikacji.

Po wykonaniu powyższych kroków powinieneś być w stanie odbierać wiadomości wysyłane za pomocą polecenia `write` w systemie Debian. Pamiętaj, że polecenie `write` działa na poziomie terminala, więc zarówno nadawca, jak i odbiorca muszą być zalogowani w terminalu.



apropos
finger
chfn
.plan


apt list --installed
apt install mc htop tmux net-ttols neofetch iptraf etckeeper lynis fail2ban glances

# Skrypty

## ELF (Executable and Linkable Format)

Pierwsze znaki w pliku ELF (Executable and Linkable Format) pod Linuxem są częścią tzw. nagłówka ELF. Są one niezwykle ważne, gdyż informują system operacyjny o sposobie interpretacji zawartości pliku. Oto ich znaczenie:

1. **0x7F oraz 'ELF'**: Pierwsze cztery bajty pliku ELF zawsze zaczynają się od bajtu 0x7F, po którym następują litery 'E', 'L', 'F'. Ta sekwencja jest magicznym numerem, który umożliwia systemowi operacyjnemu rozpoznanie formatu pliku jako ELF.

2. **Klasa pliku (32-bit lub 64-bit)**: Następny bajt określa, czy plik jest przeznaczony dla systemu 32-bitowego czy 64-bitowego.

3. **Format kodowania danych (Big Endian lub Little Endian)**: Kolejny bajt wskazuje na sposób kodowania danych - czy jest to Big Endian, gdzie najbardziej znaczący bajt jest przechowywany jako pierwszy, czy Little Endian, gdzie najpierw przechowywany jest najmniej znaczący bajt.

4. **Wersja pliku ELF**: Wskazuje na wersję formatu ELF użytego w pliku.

5. **Typ procesora i systemu operacyjnego**: Kolejne bajty określają typ procesora i system operacyjny, dla którego plik został skompilowany.

6. **Pozostałe elementy nagłówka**: Zawierają informacje takie jak punkt wejścia programu, położenie tabeli segmentów programu, położenie tabeli nagłówków sekcji oraz ich wielkości i ilość.

Nagłówek ELF jest kluczowy dla poprawnego załadowania i wykonania pliku w systemie operacyjnym Linux. Zapewnia on wszystkie niezbędne informacje potrzebne do prawidłowego zarządzania kodem zawartym w pliku.

### Shebang


Shebang to specjalna sekwencja znaków na początku skryptu tekstowego, która wskazuje, który interpreter powinien zostać użyty do wykonania zawartości pliku.

Oto jak to działa:

Shebang: Na początku skryptu znajduje się linia zaczynająca się od #!, po której następuje ścieżka do interpretera. Na przykład, #!/bin/bash wskazuje, że skrypt powinien być wykonany przez interpreter Bash, a #!/usr/bin/env python3 wskazuje na interpreter Python 3.

Uruchamianie Skryptu: Gdy użytkownik próbuje uruchomić skrypt (np. ./skrypt.sh), system operacyjny sprawdza pierwsze dwa znaki pliku. Jeśli są to #!, system przekazuje plik do interpretera określonego w shebangu.

Interpreter: Interpreter wskazany w shebangu otwiera plik, interpretuje jego zawartość i wykonuje polecenia w nim zawarte.

Ciekawostką jest, że choć to nie kernel bezpośrednio interpretuje shebang, to mechanizm ten jest wspierany na poziomie systemu plików w kernelu. Dzięki temu możliwe jest rozpoznanie i właściwe przetworzenie plików ze skryptami. Bez tego wsparcia, użytkownik musiałby ręcznie wskazać interpreter, aby uruchomić skrypt, np. bash skrypt.sh zamiast po prostu ./skrypt.sh.


## Jak to działa w systemie

Proces rozpoznawania przez system operacyjny, czy dany plik to skrypt wymagający interpretera, czy kod binarny (tak jak ELF), odbywa się w kilku krokach:

1. **Sprawdzenie uprawnień do wykonania**: Gdy użytkownik próbuje uruchomić plik, system najpierw sprawdza, czy plik ma ustawione uprawnienia do wykonania. Jeśli nie, proces jest zatrzymywany.

2. **Odczytanie pierwszych bajtów pliku**: System operacyjny odczytuje pierwsze bajty pliku, aby zdecydować, jak go interpretować. Dla plików wykonywalnych (np. ELF), te pierwsze bajty zawierają specjalny nagłówek binarny.

3. **Rozpoznanie shebangu**: Jeśli plik zaczyna się od sekwencji `#!` (shebang), system rozumie, że plik jest skryptem i musi być przekazany do odpowiedniego interpretera. Po znakach `#!` następuje ścieżka do interpretera, który powinien być użyty.

4. **Wywołanie interpretera**: System uruchamia interpreter określony w shebangu, przekazując mu ścieżkę do skryptu jako argument. Na przykład, dla skryptu z shebangiem `#!/bin/bash`, system wywoła `/bin/bash /ścieżka/do/skryptu`.

5. **Wykonywanie skryptu przez interpreter**: Interpreter odczytuje i wykonuje polecenia zawarte w skrypcie. 

6. **Kontynuacja lub zakończenie procesu**: Po zakończeniu wykonywania skryptu przez interpreter, kontrola wraca do systemu operacyjnego, który kontynuuje swoje normalne działanie lub kończy proces, jeśli to koniec skryptu.

W przypadku plików binarnych (np. ELF), system rozpoznaje je przez ich nagłówek i natychmiast przystępuje do ich ładowania i wykonania, zamiast przekazywać je do interpretera. Jest to możliwe dzięki różnym formatom nagłówków dla plików wykonywalnych i skryptów tekstowych.

### To samo, ale nieco detaliczniej

Proces identyfikacji i uruchamiania plików wykonywalnych lub skryptów z shebangiem (`#!`) w systemie Linux odbywa się na kilku poziomach, od wywołań użytkownika aż po niskopoziomowe operacje kernela. Oto szczegółowy opis, jakie funkcje systemowe są zaangażowane w ten proces:

1. **Wywołanie przez Użytkownika**: Gdy użytkownik próbuje uruchomić plik (np. przez wpisanie `./skrypt.sh` w terminalu), shell (np. bash) wykonuje funkcję `execve()`. Jest to funkcja systemowa, która służy do uruchamiania nowego programu, zastępując bieżący proces.

2. **Odczyt Nagłówka Pliku przez Kernel**: Kernel, po otrzymaniu żądania od `execve()`, próbuje odczytać nagłówek pliku, aby zdecydować, jak go obsłużyć. Robi to za pomocą niskopoziomowych operacji wejścia-wyjścia.

3. **Rozpoznanie Shebangu**: Jeśli pierwsze dwa znaki pliku to `#!`, kernel rozpoznaje plik jako skrypt tekstowy. W tym momencie kernel analizuje resztę linii po `#!`, aby znaleźć ścieżkę do odpowiedniego interpretera.

4. **Wywołanie Interpretera**: Kernel używa ponownie `execve()`, ale tym razem do uruchomienia interpretera określonego w shebangu, przekazując mu ścieżkę do skryptu jako argument.

5. **Przetwarzanie Skryptu przez Interpreter**: Interpreter, teraz działający jako proces, odczytuje i wykonuje polecenia zawarte w skrypcie.

Warto zauważyć, że proces ten różni się od ładowania zwykłych plików wykonywalnych (takich jak ELF), gdzie kernel bezpośrednio zajmuje się ładowaniem pliku do pamięci i uruchamianiem go, bez konieczności przekazywania kontroli do zewnętrznego interpretera.

Dodatkowo, w zależności od dystrybucji i konfiguracji systemu Linux, mogą być używane różne shelle oraz mechanizmy uruchamiania plików, ale opisany powyżej proces `execve()` i interpretacji shebangu jest dość uniwersalny w kontekście systemów Unixopodobnych.