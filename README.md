
# README　このアプリについて
***

## :gift:Fmarket（メルカリコピーサイト）とは
プログラミングスクールTECH::EXPERT64期最終課題制作物。
スクラム（チーム５人）によるアジャイル開発により制作。
メルカリの機能である新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能などを忠実に再現した。

## :memo:概要
* アプリ名：Fmarket
* 使用言語：HTML/CSS/Ruby/Rails/JavaScript/jQuery/MySQL/AWS/Github/Visual Studio Code
* 機能：新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能・パンくず機能・コメント機能
* 作業人数：5人
* 作業期間：約4週間
* タスク管理：Trello

## :earth_africa:URL
### URL：[http://3.113.185.115/](http://3.113.185.115/)

Basic認証をかけています。閲覧時は以下のIDとPassを入力してください。
### :lock:ID&Pass
* ID: mercari64j
* Pass:6464

## :memo:テスト用アカウント

### :moneybag:購入者アカウント
* メール：buyer_user@gmail.com
* パスワード: buyer_user

### :credit_card:購入用カード情報
* 番号：4242424242424242
* 期限：2020年12月
* セキュリティコード：123

### :gift:出品者用アカウント
* メール：seller_user@gmail.com
* パスワード：seller_user


## :computer:機能詳細

<h2 align="center">〜トップページ〜</h2>
<p align="center">CSSのみを使ったドロップダウンメニューやiQueryのslickを使ったスライドショーがある。（カテゴリ機能は未実装）</p>

![443e569470d212910f0847177034a30e](https://user-images.githubusercontent.com/57311079/72126763-adb80380-33b0-11ea-88b3-fa778a2c19a1.gif)

<h2 align="center">〜新規会員登録機能〜</h2>
<p align="center">個人情報と住所とクレジットカード情報を登録する事で会員登録できる。</p>

![329315356786613f3a5c13c32ebbc38d](https://user-images.githubusercontent.com/57311079/72133850-cbdc2e80-33c5-11ea-9668-57f9253118ff.gif)

<h2 align="center">〜商品出品機能〜</h2>
<p align="center">会員登録すれば商品を出品する事ができる。商品画像は10枚まで登録できる。商品の状態や発送方法などを細かく設定できる。</p>

![27d7c8356910f4ad8ad04bad913616dd](https://user-images.githubusercontent.com/57311079/72127280-8104eb80-33b2-11ea-8b8d-4c1dee5efa3a.gif)

<h2 align="center">〜商品詳細ページ〜</h2>
<p align="center">iQueryのslickを使ったサムネイルつきスライドショーがある。商品の状態や配送元などを詳しく見る事ができる</p>

![64f63b6e4d396cbacdb96b1fbd0de5b3](https://user-images.githubusercontent.com/57311079/72127481-26b85a80-33b3-11ea-8c6d-cff0cd01e110.gif)

<h2 align="center">〜商品編集ページ〜</h2>
<p align="center">商品画像と商品情報の追加・削除・変更が行える。</p>

![3b08c8991394634587f0170b802ad344](https://user-images.githubusercontent.com/57311079/72129557-fd4efd00-33b9-11ea-88e1-1cc1103160f2.gif)

<h2 align="center">〜商品購入機能〜</h2>
<p align="center">仮想クレジットPayjpを使い仮想的に商品購入できる。購入した商品にはSOLDマークがつき購入できなくなる。</p>

![c1d1cb40747b2e899e84ccf5a2f175b7](https://user-images.githubusercontent.com/57311079/72129791-d9d88200-33ba-11ea-959f-0400c05c63d6.gif)

<h2 align="center">〜コメント機能〜</h2>
<p align="center">出品させた商品にコメントでき、出品者と交渉する事ができる。</p>

![db201a0b4a1e87a0083f6a1c461827f8](https://user-images.githubusercontent.com/57311079/72130231-2ec8c800-33bc-11ea-8110-ad258f47933e.gif)


# :memo:DB設計
## users テーブル

| Column          | Type   | Options                 |
| --------------- | ------ | ----------------------- |
| nickname        | string |                         |
| email           | string | null: false,unique:true |
| first_name      | string | null: false             |
| last_name       | string | null:false              |
| first_name_kana | string | null:false              |
| last_name_kana  | string | null:false              |
| birthyear       | string | null:false              |
| birthmonth      | string | null:false              |
| birthday        | string | null:false              |
| telephone       | string | null:false              |
| icon            | text   |                         |
| text            | text   | null:false              |

### Association

has_one:address, dependent: :destroy
has_many:messages, dependent: :destroy
has_many:items, dependent: :destroy
has_many:comments, dependent: :destroy
has_many:likes, dependent: :destroy

## address テーブル

| Column          | Type    | Options                     |
| --------------- | ------- | --------------------------- |
| first_name      | string  | null: false                 |
| last_name       | string  | null:false                  |
| first_name_kana | string  | null:false                  |
| last_name_kana  | string  | null:false                  |
| post_cord       | integer | null:false                  |
| prefecture_id   | string  | null:false                  |
| city            | string  | null:false                  |
| address         | string  | null:false                  |
| building        | text    |                             |
| telephone       | string  |                             |
| user_id         | integer | null:false,foreign_key:true |

### Association

belongs_to:user

## likes テーブル

| Column  | Type    | Options                     |
| ------- | ------- | --------------------------- |
| item_id | integer | null:false,foreign_key:true |
| user_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item
belongs_to:user

## items テーブル

| Column | Type | Options |
| --------------- | ------- | ---------- |
| name | string | null:false |
| size | string | |
| condition | string | null:false |
| shipping_method | string | null:false |
| shipping_days | string | null:false |
| shipping_area | string | null:false |
| shipping_price | integer | null:false |
| price | integer | null:false |
| text | text | null:false |
| seller_id | integer | null:false |
| buyer_id | integer | |
| brand_id | integer | |
| category_id | references | null:false,foreign_key:true|
| prefecture_id | integer | null:false |
| sale_status | string | null:false |

### Association

belongs_to:user
belongs_to:category, dependent: :destroy
has_many:item_images, dependent: :destroy
has_many:messages, dependent: :destroy
belongs_to:bland, dependent: :destroy
has_many:likes, dependent: :destroy
has_many:comments, dependent: :destroy

## categories テーブル

| Column     | Type   | Options    |
| ------     | ------ | ---------- |
| name       | string | null:false |
| ancestry   | string | null:false |

### Association

has_many:items

## item_images テーブル

| Column  | Type    | Options                     |
| ------- | ------- | --------------------------- |
| image   | text    |                             |
| item_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item

## comments テーブル

| Column  | Type    | Options                     |
| ------- | ------- | --------------------------- |
| text    | text    | null:false                  |
| item_id | integer | null:false,foreign_key:true |
| user_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item
belongs_to:user

## messages テーブル

| Column    | Type    | Options                     |
| --------- | ------- | --------------------------- |
| text      | text    | null:false                  |
| item_id   | integer | null:false,foreign_key:true |
| buyer_id  | integer | null:false,foreign_key:true |
| seller_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item
belongs_to:user

## brands テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association

has_many:items
has_many:genres,through: :brands_genres
has_many:brands_genres

## brands_genres テーブル

| Column   | Type    | Options                     |
| -------- | ------- | --------------------------- |
| brand_id | integer | null:false,foreign_key:true |
| genre_id | integer | null:false,foreign_key:true |

### Association

belongs_to:brand
belongs_to:genre

## genres テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association

has_many:brands,through: :brands_genres
has_many:brands_genres



## cards テーブル

| Column        | Type   | Options    |
| ------        | ------ | ---------- |
| user_id       | integer | null:false |
| customer_id   | integer | null:false |
| card_id       | integer | null:false |

### Association
#後ほど記入
#belongs_to :user 



##  residencesテーブル

| Column          | Type   | Options    |
| ------          | ------ | ---------- |
| prefecture_id   | integer | null:false |
| city            | text | null:false |

### Association
#後ほど記入
#belongs_to_active_hash :prefecture

## :memo:ER図
![1516d2d4b35a1708d30d2a33762c3488](https://user-images.githubusercontent.com/57311079/72148618-9a269000-33e4-11ea-835d-2838c76e2be0.png)
