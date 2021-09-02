## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name_kanji    | string  | null: false               |
| last_name_kanji     | string  | null: false               |
| first_name_kana     | string  | null: false               |
| last_name_kana      | string  | null: false               |
| birthday            | date    | null: false               |

### Association

has_many :items
has_many :logs

## items テーブル

| Column           | Type        | Options                         |
| ---------------- | ----------- | ------------------------------- |
| title            | string      | null: false                     |
| explanation      | text        | null: false                     |
| category_id      | integer     | null: false                     |
| state_id         | integer     | null: false                     |
| delivery_fee_id  | integer     | null: false                     |
| region_id        | integer     | null: false                     |
| shipping_date_id | integer     | null: false                     |
| price            | integer     | null: false                     |
| user             | references  | null: false, foreign_key: true  |

### Association

belongs_to :user
has_one :log

## logs テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :order

## orders テーブル

| Column               | Type       | Options                         |
| -------------------- | ---------- | ------------------------------- |
| postcode             | string     | null: false                     |
| region_id            | integer    | null: false                     |
| city                 | string     | null: false                     |
| address              | string     | null: false                     |
| building_name        | string     |                                 |
| phone_number         | string     | null: false                     |
| log                  | references | null: false, foreign_key: true  |

### Association

belongs_to :log

