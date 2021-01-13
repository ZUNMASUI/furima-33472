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
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :prototypes
- belongs_to :users

## addresses テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- has one :solds
