# README

# 事業概要
海外のサイトから購入をしたいけど、輸送費に対してネガディブな人が手軽に安く海外から日本に輸入できるアプリである。

## URL

## テスト用アカウント

## システム
日本からの購入者はその国のShipping monsterの倉庫に商品を送り届ける。<br>
Shipping monsterの倉庫に送られきた商品に紐づいたユーザーへメールを送る。<br>確認が取れたユーザーは輸送の要求を送る。
現地Shipping monsterの倉庫から日本のShipping monsterの倉庫へ送られる。
<br>
日本のShipping monsterの倉庫から各ユーザーの住所へ送られる。
<br>
ユーザー登録をしないと、Shipping monsterの倉庫の住所を選択できない。

## 目指した課題解決
コロナウィルスの中、海外旅行好きでショッピングが好きなひとたちの為にこのアプリを作成した。<br>
欲しい商品を海外のサイトで買う時は、個人輸送になってしまい割高になることが多く、消費者にとってそこはデメリットである。<br>
そこを法人輸送で輸送費を安く済ませ、手軽に海外で買い物ができる仕組みがあったら便利だなという思考でSHIPPING MONSUTERを作成した。

## 大きく３点　洗い出し用件
### devise導入
サービス利用に当たって、ユーザ登録を必須とした。<br>
最低限必要な入力項目だけに絞って、ストレスなく登録をしてもらうことを優先した。
### review機能
ユーザーが実際にサービスを利用して、レビューできる仕組みを作成。<br>
SIPPING MONSTERを使って感動したことや改善が必要なことをユーザー同志で共有して、よりよいサービスの提供をできるため作成。
### 問合せ機能
会社に問い合わせる機能として作成。<br>
サービス内容の疑問点や困ったことの窓口として設置。<br>
### 英語表記機能
日本に住んでいる外国人にも利用してもらえるように英語版でもりようできるよう実装。<br>
日本に来ている外国人コミュニティはせまいので、<br>
口コミで広がって多数の人に使用してもらえるようにと考えた。




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
