#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Toriyamasan
# SPDX-License-Identifier: MIT

out=$(echo "1h 30m" | ./sumtime)
[ "${out}" = "1h 30m" ] || exit 1

out=$(echo "45m" | ./sumtime)
[ "${out}" = "45m" ] || exit 1

out=$(echo "1.5h" | ./sumtime)
[ "${out}" = "1h 30m" ] || exit 1

echo "OK"
