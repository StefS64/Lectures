# Wykłady Stefana Świerczewskiego

Zebrane materiały wykładowe.


## Zawartość

| Plik | Tytuł | Grupa | Rok |
| --- | --- | --- | --- |
| `wyklady/inwersja.tex` | Inwersja | finaliści | 2025 |
| `wyklady/funkcje_tworzace.tex` | Funkcje tworzące | finaliści | 2025 |
| `wyklady/am_gm.tex` | Od AM--GM do AM--HM i nie tylko | juniorzy | 2026 |
| `wyklady/kolorowanki_i_numerowanki.tex` | Kolorowanki i numerowanki | juniorzy | 2026 |
| `wyklady/grafy_turniejowe.tex` | Turnieje: porządek ukryty w chaosie | finaliści | 2026 |
| `wyklady/nierownosci_metoda_stycznej.tex` | Nierówności, metoda stycznej | finaliści | 2026 |
| `wyklady/trudne_grafy.tex` | Zaawansowane grafy | finaliści | 2026 |

W głównym katalogu źródeł pominięto starsze kopie robocze „Inwersji”
i „Nierówności, metody stycznej”, ponieważ baza zawiera ich nowsze,
uzupełnione wersje. Odrębne wydanie „Inwersji” z 2024 roku zachowano jako PDF
w archiwum.

## Archiwalne materiały bez źródeł LaTeX

Katalog `archiwum_pdf/` zawiera również autorskie lub współautorskie wykłady
Stefana Świerczewskiego, dla których w bazie nie ma odpowiadającego im źródła
`.tex`, oraz zachowane, wyraźnie różniące się wersje robocze:

| Rok | Materiał | Uwagi |
| --- | --- | --- |
| 2023 | Potęga punktu, osie potęgowe i nie tylko | współautor: Mikołaj Cudny |
| 2024 | Niezmienniki | autor i prowadzący: Stefan Świerczewski |
| 2024 | Indukcja | autor i prowadzący: Stefan Świerczewski |
| 2024 | Inwersja | autor i prowadzący: Stefan Świerczewski |
| 2025 | Funkcje tworzące -- wersja z rozwiązaniami | zachowany PDF z `my_Lectures` |
| 2026 | Trudne grafy | cztery różne archiwalne warianty |

PDF „Potęga punktu” z WM 2024 nie został zaliczony do materiałów autorskich:
Stefan Świerczewski figuruje w nim jako prowadzący, natomiast autorem jest
Miron Hunia.

## Kompilacja

Wymagane są GNU Make, pdfLaTeX z pełnym zestawem pakietów TeX Live oraz
Inkscape. Kompilacja korzysta z `--shell-escape` do obsługi grafik SVG.

```sh
make              # wersje dla uczestników
make sol          # wersje z rozwiązaniami: *_sol.pdf
make all          # oba warianty
make clean        # usuwa pliki pomocnicze
make clean-pdf    # usuwa również wygenerowane PDF-y
```

Pojedynczy materiał można zbudować na przykład tak:

```sh
make -C wyklady inwersja.pdf
make -C wyklady trudne_grafy_sol.pdf
```
