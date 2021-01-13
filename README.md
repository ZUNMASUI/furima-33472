# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| realname   | string | null: false |
| kananame   | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :solds

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| image               |            |                                |
| explanation         | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping_fee        | string     | null: false                    |
| shipping_prefecture | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :solds
- belongs_to : user

## solds テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| address          | string     | null: false                    |
| house_number     | text       | null: false                    |
| building_number  | text       | null: true                     |
| phone_number     | integer    | null: false                    |
| sold             | references | null: false, foreign_key: true |

### Association

- has one :solds
