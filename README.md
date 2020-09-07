# README

# 事業概要
海外のサイトから購入をしたいけど、輸送費に対してネガディブな人が手軽に安く海外から日本に輸入できるアプリである。

## URL

## テスト用アカウント

## システム
日本からの購入者はその国のShipping monsterの倉庫に商品を送り届ける。
Shipping monsterの倉庫に送られきた商品に紐づいたユーザーへメールを送る。
確認が取れたユーザーは輸送の要求を送る。
現地Shipping monsterの倉庫から日本のShipping monsterの倉庫へ送られる。
日本のShipping monsterの倉庫から各ユーザーの住所へ送られる。

ユーザー登録をしないと、Shipping monsterの倉庫の住所を選択できない。

## 目指した課題解決
コロナウィルスの中、海外旅行好きでショッピングが好きなひとたちの為にこのアプリを作成した。
欲しい商品を海外のサイトで買う時は、個人輸送になってしまい割高になることが多く、消費者にとってそこはデメリットである。
そこを法人輸送で輸送費を安く済ませ、手軽に海外で買い物ができる仕組みがあったら便利だなという思考でSHIPPING MONSUTERを作成した

## 洗い出し用件



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# テーブル設計

## users テーブル

| Column          | Type   | Options                      |
| --------------- | ------ | ---------------------------- |
| email           | string | null: false                  |
| password        | string | null: false                  |
| family_name     | string | null: false                  |
| first_name      | string | null: false                  |
| nickname        | string | null: false                  |
| birthday        | date   | null: false                  |
### Association

- has_many :reviews
- has_one :address


## reviews テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| content        | string     | null: false                    |
| score          | integer    | null: false                    |
### Association

- belongs_to :user

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address1       | string     | null: false                    |
| address2       | string     |                                |
| telephone      | string     | null: false, unique: true      |
| user           | references | null: false, foreign_key: true |
### Association

- belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
