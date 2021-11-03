# README

## userテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false unique: true　|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| last_name_reading  | string | null: false |
| first_name         | string | null: false |
| first_name_reading | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## itemsテーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| image                    | string     |                                |
| item_name                | string     | null: false                    |
| explanation              | text       | null: false                    |
| detail(category, status) | text       | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| token  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipmentsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal-code      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| house-number     | string     | null: false                    |
| building-name    | string     | null: false                    |
| telephone-number | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item