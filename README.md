# Wykłady Stefana Świerczewskiego

Zebrane materiały wykładowe znalezione w lokalnej bazie warsztatów.
Repozytorium jest samodzielne: zawiera źródła, klasy LaTeX, reguły budowania
i potrzebne grafiki.

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

Starsze kopie robocze „Inwersji” i „Nierówności, metody stycznej” pominięto,
ponieważ baza zawiera ich nowsze, uzupełnione wersje.

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
