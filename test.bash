#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Toriyamasan
# SPDX-License-Identifier: GPL-3.0-only

ng() {
    echo No.${1} is failed
    res=1
}

res=0

# 正常な入力のテスト

# 1h 30m
out=$(echo "1h 30m" | ./sumtime | tr -d '\n')
[ $? = 0 ] || ng "$LINENO"
[ "${out}" = "1h 30m" ] || ng "$LINENO"

# 45m
out=$(echo "45m" | ./sumtime | tr -d '\n')
[ $? = 0 ] || ng "$LINENO"
[ "${out}" = "45m" ] || ng "$LINENO"

# 1.5h
out=$(echo "1.5h" | ./sumtime | tr -d '\n')
[ $? = 0 ] || ng "$LINENO"
[ "${out}" = "1h 30m" ] || ng "$LINENO"

# 不正な入力のテスト

# 空入力
out=$(echo "" | ./sumtime)
[ $? != 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 数字なし
out=$(echo "abc" | ./sumtime)
[ $? != 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 単位が不正
out=$(echo "10x" | ./sumtime)
[ $? != 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 負の値
out=$(echo "-1h" | ./sumtime)
[ $? != 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo ok 
exit $res

