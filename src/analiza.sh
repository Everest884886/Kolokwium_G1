
#!/usr/bin/env bash
KATALOG="${1:-dane}"
if [[ ! -d "$KATALOG" ]]; then
echo "brak katalogu" >&2
exit 2

fi
#ile_warnow=$(grep -c '^WARN' "$PLIK")
#if [[ "$ile_warnow" -ge 2 ]]; then
#STATUS="ALARM"
#else
#STATUS="OK"
#fi

cd "/home/stud2026/6sikon/Kolokwium_G1" 
for PLIK in dane/*.log; do
liczba_errorow=$(grep -c "^ERROR" "$PLIK")
ile_warnow=$(grep -c '^WARN' "$PLIK")
if [[ "$ile_warnow" -ge 2 ]]; then
STATUS="ALARM"
else
STATUS="OK"
fi


echo  "$PLIK" "$liczba_errorow" "$STATUS"
done


# Kolokwium — plik do samodzielnego uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: nazwa.log;liczba_ERROR;STATUS

# TODO 1: katalog z argumentu albo domyślnie 'dane'.
# TODO 2: if -d; błąd na stderr i exit 2.
# TODO 3: for po *.log; uwzględnij katalog bez plików .log.
# TODO 4: grep i liczenie wierszy ERROR dla każdego pliku.
# TODO 5: if wyznaczający STATUS zgodnie z ZADANIA.md.
# TODO 6: printf trzy pola oddzielone średnikami.
