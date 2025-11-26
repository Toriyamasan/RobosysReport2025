#!/bin/bash -xv

out=$(echo "1h 30m" | python3 ./sumtime)
[ "${out}" = "1h 30m" ] || exit 1

out=$(echo "45m" | python3 ./sumtime)
[ "${out}" = "45m" ] || exit 1

out=$(echo "1.5h" | python3 ./sumtime)
[ "${out}" = "1h 30m" ] || exit 1

echo "OK"
