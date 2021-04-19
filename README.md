# テーブル設計

## users テーブル
| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name_kanji       | string  | null: false               |
| first_name_kanji      | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_year            | integer | null: false               |
| birth_month           | integer | null: false               |
| birth_day             | integer | null: false               |
### Association
- has_many :items
- has_many :purchase_histories


## itemsテーブル
| Column              | Type         | Options                        |
| ------------------- | ------       | ------------------------------ |
| image               | ActiveStorage                                 |
| product_name        | text         | null: false                    |
| product_description | text         | null: false                    |
| category            | string       | null: false                    |
| condition           | string       | null: false                    |
| shipping_charges    | integer      | null: false                    |
| shipping_area       | string       | null: false                    |
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
- has one : address


## addressesテーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | integer    | null: false |
| prefecture          | string     | null: false |
| municipality        | string     | null: false |
| house_number        | string     | null: false |
| building_name       | string     |             |
| phone_number        | integer    | null: false |
### Association
- belongs_to :purchase_history