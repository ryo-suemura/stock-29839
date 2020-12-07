# README


# アプリケーション名
在庫管理
![トップ](https://i.gyazo.com/985954eb39585a9182bf1eb1923d2f9b.png)



# 概要

本アプリは書店における在庫管理のほんの一部分を実装したアプリケーションです。
下記()以外の部分の流れをかなり簡略化して実装しました。

* お客さんが商品を購入 → 売った商品の在庫数が減少

* 在庫数をもとに商品を発注 (→ 発注の情報が本部へ → 本部から商品が到着 → 商品登録) → 商品の在庫数が増加 



# URL
 https://stock-29839.herokuapp.com/

# テスト用アカウント

basic認証
ID: minimal
Pass: 0508

ログイン(ユーザー名はA)
Email: a@a.com
Pass: aaaaaa1


# 利用方法

* お客さんが商品を購入したと仮定し、一覧画面にある購入ボタンを押して数を入力するとその分だけ商品の在庫数が減ります。
* 反対に、発注ボタンを押して数を入力するとその分の商品在庫が増えます。
* 新規の在庫商品の追加も可能です。


# アプリ作成に当たっての課題意識
 
 * よく通っている地元の古書店の在庫管理を簡単にしたい。
 * 学習して数ヶ月のため、アプリの制作に慣れたい。


# 洗い出した要件

* ユーザー管理機能
* 在庫一覧表示機能
* 商品登録機能
* 購入・発注機能
* 検索機能

以下は実装予定
* 発注履歴表示
* 在庫商品編集機能
* 傾向分析機能

# 実装した機能についての説明

* ユーザー管理機能
新規登録の場合、名前/Eメール/パスワードで登録する。ログインの場合、Eメール/パスワードでログインする。

# 在庫一覧表示機能
ログイン後、表形式で在庫情報が表示される。

# 商品登録機能
商品を追加ボタンをクリックすると、商品登録ページへ遷移。フォームを入力後、登録が完了する。

# 購入・発注機能
トップページの在庫商品ごとに表示されている、購入及び発注ボタンを押して個数を入力すると、その分だけ在庫数の表示が変わる。

# 検索機能
商品番号/商品名/著者で検索をかけると、それに該当した商品が表示される。商品の情報名をクリックすると、在庫商品を昇降順にソートすることができる。複数在庫があることが前提。

# データベース設計
 [ER図のリンク](https://app.diagrams.net/#G1Jp9qHrKOWoOAIk6UM9_wM5-1P-JLPQEj)


## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :stocks
- has_many :purchases

## stocksテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| number        | integer    | null: false       |
| name          | string     | null: false       |
| author        | string     | null: false       |
| stock         | integer    | null: false       |
| genre_id      | integer    | null: false       |
| code_id       | integer    | null: false       |
| publisher_id  | integer    | null: false       |
| user          | references | foreign_key: true |


## Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| quantity        | integer    | null: false                    |
| item_id         | integer    | null: false, foreign_key: true |
| user_id         | integer    | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :stock


## ordersテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| quantity        | integer    | null: false                    |
| stock           | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :stock

