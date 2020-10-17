# DB 設計

## users table

| Column            | Type       | Options                   |
|-------------------|------------|---------------------------|
| nickname          | string     | null: false, unique: true |
| email             | string     | null: false, unique: true |
| password          | string     | null: false               |
| first_name_full   | string     | null: false               |
| last_name_full    | string     | null: false               |
| first_name_kana   | string     | null: false               |
| last_name_kana    | string     | null: false               |
| birth_year        | date       | null: false               |
| birth_month       | date       | null: false               |
| birth_day         | date       | null: false               |
| order             | references | foreign_key: true         |

### Association

- has_many :items
- has_many :orders
- has_many :order_users



## items table

| Column           | Type       | Option            |
|------------------|------------|-------------------|
| item             | string     | null: false       |
| description      | text       | null: false       |
| category         | string     | null: false       |
| status           | string     | null: false       |
| delivery         | string     | null: false       |
| area             | string     | null: false       |
| day              | string     | null: false       |
| price            | string     | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order_users



## order_users table

| Column  | Type      | Option            |
|-------- |-----------|-------------------|
| user    |references | foreign_key: true |
| item    |references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order_users



## orders table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_code     | string     | null: false       |
| prefecture      | string     | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     | null: false       |
| tell            | string     | null: false       |
| item            | references | foreign_key: true |

### Association

- belongs_to :item

