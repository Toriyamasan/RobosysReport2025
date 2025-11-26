# sumtime

[![test](https://github.com/Toriyamasan/RobosysReport2025/actions/workflows/test.yml/badge.svg)](https://github.com/Toriyamasan/RobosysReport2025/actions/workflows/test.yml)

標準入力からテキストを読み込み、その中に含まれる時間表記（`1h 30m`など）を抽出して合計するツールです。

## 必要な環境
* Python 3.7 以上

## インストール
リポジトリをクローンしてディレクトリに入ります。

```bash
git clone https://github.com/Toriyamasan/RobosysReport2025.git
cd RobosysReport2025
```

実行権限がない場合は付与してください

```bash
chmod +x sumtime
```

## 使い方

標準入力から文字列を渡すと、自動的に「数字h」や「数字m」を認識して合計時間を計算します。

### 基本的な使い方

時間と分を単純に入力する例です。

```bash
$ echo "1h 30m 30m" | ./sumtime
2h 0m
```

### 文章からの計算

日記やメモなど、文章の中に時間が混ざっていても、数字だけを拾って計算できます。

```bash
$ echo "昨日は2h勉強して、今日は45mゲームをした。" | ./sumtime
2h 45m
```

### ファイルからの入力

時間の記録が書かれたファイルを読み込ませることも可能です。

```bash
$ cat time_log.txt
10/1: 1h 30m 作業
10/2: 45m ミーティング
10/3: 1.5h プログラミング

$ cat time_log.txt | ./sumtime
3h 45m
```

## ライセンス

このソフトウェアパッケージは、MITライセンスの下、再頒布および使用が許可されます。 (c) 2025 Toriyamasan
