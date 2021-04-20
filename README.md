# テーブル設計

## users テーブル
| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name_kanji       | string  | null: false               |
| first_name_kanji      | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birthday              | date    | null: false               |
### Association
- has_many :items
- has_many :purchase_histories


## itemsテーブル
| Column              | Type         | Options                        |
| ------------------- | ------       | ------------------------------ |
| product_name        | string       | null: false                    |
| product_description | text         | null: false                    |
| category_id         | integer      | null: false                    |
| condition_id        | integer      | null: false                    |
| shipping_charge_id  | integer      | null: false                    |
| shipping_area_id    | integer      | null: false                    |
| days_to_ship_id     | integer      | null: false                    |
| price               | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :purchase_history


## purchase_histories テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one : address


## addressesテーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | integer    | null: false |
| prefecture_id       | integer    | null: false |
| municipality        | string     | null: false |
| house_number        | string     | null: false |
| building_name       | string     |             |
| phone_number        | string     | null: false |
### Association
- belongs_to :purchase_history