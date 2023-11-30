---
title: "Systemy Operacyjne - Krótki wstęp"
date: 2023-11-30T22:59:12+01:00
draft: false
---

# Wstęp

## Krótki wstęp

### System operacyjny

System operacyjny (OS) to podstawowe oprogramowanie, które zarządza sprzętem komputerowym i umożliwia interakcję użytkownika z komputerem. Jest to warstwa między aplikacjami a sprzętem komputerowym, koordynująca wszystkie podstawowe funkcje i procesy. 

1. Podstawowe Funkcje
   - Zarządzanie Zasobami 
   - Uruchamianie Aplikacji 
   - Interfejs Użytkownika 

2. Rodzaje Systemów Operacyjnych
   - Systemy na Komputery Osobiste:    Windows, macOS i różne dystrybucje Linuxa
   - Mobilne Systemy Operacyjne:   iOS, Android
   - Systemy Serwerowe: Windows Server, Linux Server
   - Systemy Wbudowane
   - Systemy czasu rzeczywistego 

3. Znaczenie
   - System operacyjny jest kluczowym elementem każdego komputera, umożliwiając efektywne i bezpieczne wykorzystanie jego zasobów.
   - Ułatwia interakcję użytkownika z komputerem, oferując przyjazny interfejs i zarządzanie aplikacjami.
   - Zapewnia bezpieczeństwo danych, zarządzając dostępem do zasobów i izolując różne procesy.

### Czym jest wirtualizacja?

**W kontekście przedmiotu SO**

Wirtualizacja to proces tworzenia wirtualnych, a nie fizycznych wersji systemu operacyjnego.


* Zalety: 
    Wirtualizacja pozwala na bardziej efektywne wykorzystanie zasobów sprzętowych, umożliwiając uruchamianie wielu systemów operacyjnych i aplikacji na pojedynczym fizycznym serwerze. Zapewnia to oszczędności kosztów, zwiększa elastyczność, ułatwia backup, odzyskiwanie po awarii oraz testowanie i rozwój oprogramowania.

* Rodzaje Wirtualizacji:
   - Wirtualizacja serwerów: Pojedynczy serwer fizyczny jest dzielony na wiele izolowanych serwerów wirtualnych.
   - Wirtualizacja sieci: Zasoby sieciowe, takie jak przełączniki, routery i połączenia sieciowe, są wirtualizowane.
   - Wirtualizacja pamięci masowej: Dzieli i zarządza zasobami pamięci masowej w sposób elastyczny i efektywny.
   - Wirtualizacja aplikacji: Aplikacje są uruchamiane w odizolowanych środowiskach, co zapobiega konfliktom między oprogramowaniem.

#### Hypervisor: 

To oprogramowanie umożliwiające wirtualizację, zarządzające VM-ami i przydzielające im zasoby. Istnieją dwa główne typy hipernadzorców:
   - Bare-Metal: Zainstalowany bezpośrednio na sprzęcie.
   - Hostowany: Działa na konwencjonalnym systemie operacyjnym.

#### Zalety Ochrony i Bezpieczeństwa: 

Wirtualizacja umożliwia lepsze zarządzanie bezpieczeństwem, izolując różne systemy operacyjne i aplikacje, co zmniejsza ryzyko rozprzestrzeniania się problemów z jednego systemu na inny.

#### Elastyczność i Skalowalność: 

Ułatwia skalowanie zasobów w górę lub w dół w zależności od potrzeb, bez konieczności inwestowania w dodatkowy sprzęt.

### Dostępne technologie

#### Hipervisor

##### Hipervisor - Bare-Metal
Te hipernadzorcy działają bezpośrednio na sprzęcie gospodarza, kontrolując sprzęt i zarządzając systemami operacyjnymi gości.

- VMware ESXi: Szeroko stosowany w środowiskach korporacyjnych, oferując zaawansowane funkcje i narzędzia zarządzania.
- Microsoft Hyper-V: Dostępny na Windows Server i niektórych edycjach Windows 10 i 11, znany ze swojej integracji z ekosystemami Microsoft.
- Citrix Hypervisor: Dawniej znany jako XenServer, to potężny hipernadzorca open source często używany w centrach danych.
- Oracle VM Server dla SPARC/x86: Zaprojektowany dla sprzętu Oracle, zwykle stosowany w środowiskach korporacyjnych.
- KVM (Kernel-Based Virtual Machine): Zintegrowany z Linuksem, KVM zamienia jądro Linuksa w hipernadzorcę bare-metal.

##### Hipernadzorcy - Hostowane

Te hipernadzorcy działają na konwencjonalnym systemie operacyjnym, tak jak inne programy komputerowe.

- VMware Workstation (dla Windows/Linux) i Fusion (dla macOS)
- Oracle VirtualBox
- Parallels Desktop

2. Pełne Symulacje Systemów

Te narzędzia wykraczają poza tradycyjną wirtualizację, symulując całe systemy, w tym sprzęt i środowiska sieciowe.

- QEMU: Open-source emulator, który może wykonywać wirtualizację sprzętu.
- GNS3 (Graphical Network Simulator-3): Głównie używany dla urządzeń sieciowych
- Simics: Pełny symulator systemu używany do symulacji procesorów, systemów i kompletnych systemów sieciowych.

3. Wirtualizacja Aplikacji
Skupia się na uruchamianiu poszczególnych aplikacji w odizolowanym środowisku.

- Microsoft Application Virtualization (App-V): Zaprojektowany dla środowisk Windows, pozwala aplikacjom działać w izolowanych środowiskach.
- Wine: Nie jest właściwie oprogramowaniem do wirtualizacji, ale pozwala uruchamiać aplikacje Windows na systemach operacyjnych podobnych do Unix.
- Docker: Specjalizuje się w konteneryzacji, umożliwiając aplikacjom i ich zależnościom działanie w izolowanych procesach zasobów.

4. Wirtualizacja oparta na chmurze

- Amazon EC2 (część AWS)
- Google Compute Engine
- Microsoft Azure Virtual Machines

5. Specjalistyczne lub niszowe narzędzia do wirtualizacji

- Bochs: Emulator dla platform x86 i x86-64, bardziej skupiony na dokładności emulacji.
- Bhyve: Lekki hipernadzorca działający na FreeBSD.
- Gem5: To już jest bardziej symulator architektury
