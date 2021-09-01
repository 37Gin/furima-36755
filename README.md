## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| mail                | string  | null: false |
| encrypted_password  | string  | null: false |
| first_name_kanji    | string  | null: false |
| last_name_kanji     | string  | null: false |
| first_name_kana     | string  | null: false |
| last_name_kana      | string  | null: false |
| birthday_year       | integer | null: false |
| birthday_month      | integer | null: false |
| birthday_day        | integer | null: false |

### Association

has_many :items
has_many :orders

## items テーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |
| title         | string      | null: false                     |
| explanation   | text        | null: false                     |
| category      | string      | null: false                     |
| state         | string      | null: false                     |
| delivery_fee  | string      | null: false                     |
| region        | string      | null: false                     |
| shipping_date | string      | null: false                     |
| user          | references  | null: false, foreign_key: true  |

### Association

belongs_to :user
has_one :order

## orders テーブル

| Column               | Type       | Options                         |
| -------------------- | ---------- | ------------------------------- |
| card_number          | integer    | null: false                     |
| card_validity_month  | integer    | null: false                     |
| card_validity_year   | integer    | null: false                     |
| card_css             | integer    | null: false                     |
| postcode             | integer    | null: false                     |
| prefecture           | string     | null: false                     |
| city                 | string     | null: false                     |
| address              | string     | null: false                     |
| building_name        | string     |                                 |
| phone_number         | integer    | null: false                     |
| user                 | references | null: false, foreign_key: true  |
| item                 | references | null: false, foreign_key: true  |

### Association

belongs_to :user
belongs_to :item

