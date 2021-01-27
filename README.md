# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :solds

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| shipping_prefecture_id | integer    | null: false                    |
| shipping_days_id       | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- has_one :sold
- belongs_to : user

## solds テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column                     | Type       | Options                       |
| -------------------------- | ---------- |-------------------------------|
| postcode                   | string     |null:false                    | 
| shipping_prefecture_id     | integer    |null:false                     |
| address                    | string     |null:false                     |
| house_number               | string     |null:false                     |
| building_number            | string     |                               |
| phone_number               | string     |null:false                     |
| sold                       |references | null: false, foreign_key: true |

### Association

-  belongs_to :sold
