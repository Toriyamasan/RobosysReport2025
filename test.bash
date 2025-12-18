#!/bin/bash
# SPDX-FileCopyrightText: 2025 Toriyamasan
# SPDX-License-Identifier: GPL-3.0-only

ng() {
    echo "No.${1} failed"
    res=1
}

res=0

# --- 正常な入力のテスト ---
out=$(echo "1h 30m" | ./sumtime)
[ $? = 0 ] || ng "$LINENO"
[ "${out}" = "1h 30m" ] || ng "$LINENO"

# --- 不正な入力のテスト（あえて失敗させて exit 1 か確認する） ---
# 空入力
echo "" | ./sumtime
[ $? != 0 ] || ng "$LINENO"

# 数字や単位がない文字
echo "あいうえお" | ./sumtime
[ $? != 0 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo ok
exit $res
