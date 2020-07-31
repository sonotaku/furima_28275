# テーブル設計

## users テーブル

| Column           | Type   | Options    |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| flat_family_name | string | null: false |
| flat_first_name  | string | null: false |
| birthday         | date   | null: false |
| email            | string | null: false |
| password         | string | null: false | 

### Association
- has_many :items
- has_many :order_items
- has_one :addresses
## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | integer    | null: false, foreign_key: true |
| image       | string     |null: false                     |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |

### Association

- has_many :order_items
- belongs_to :user

## order_items テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal        | string  | null: false                    |
| place         | string  | null: false                    |
| address       | string  | null: false                    |
| building      | string  |                                |
| phone         | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |
| item_id       | integer | null: false, foreign_key: true |

 ### Association

 - belongs_to :order_item
 - belongs_to :user
