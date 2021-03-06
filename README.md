# DB 設計

## users table

| Column            | Type       | Options                   |
|-------------------|------------|---------------------------|
| nickname          | string     | null: false, unique: true |
| email             | string     | null: false, unique: true |
| password          | string     | null: false               |
| last_name         | string     | null: false               |
| first_name        | string     | null: false               |
| last_name_kana    | string     | null: false               |
| first_name_kana   | string     | null: false               |
| birth_date        | date       | null: false               |

### Association

- has_many :items
- has_many :order_users



## items table

| Column              | Type        | Option            |
|---------------------|-------------|-------------------|
| name                | string      | null: false       |
| description         | text        | null: false       |
| category_id         | integer     | null: false       |
| status_id           | integer     | null: false       |
| delivery_id         | integer     | null: false       |
| area_id             | integer     | null: false       |
| day_id              | integer     | null: false       |
| price               | string      | null: false       |
| user                | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one :order_user



## order_users table

| Column  | Type      | Option            |
|-------- |-----------|-------------------|
| user    |references | foreign_key: true |
| item    |references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order



## orders table

| Column             | Type        | Options           |
|--------------------|-------------|-------------------|
| postal_code        | string      | null: false       |
| prefecture_id      | integer     | null: false       |
| municipality       | string      | null: false       |
| address            | string      | null: false       |
| building_name      | string      |                   |
| tell               | string      | null: false       |
| order_user         | references  | foreign_key: true |

### Association

- belongs_to :order_user