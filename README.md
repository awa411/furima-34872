## Users Table
| Column                  | Type    | Options                   |
| ----------------------- | ------- | ------------------------- |
| nickname                | string  | null: false               |
| email                   | string  | null: false, unique: true |
| encrypted_password      | string  | null: false               |
| last_name               | string  | null: false               |
| first_name              | string  | null: false               |
| last_name_kana          | string  | null: false               |
| first_name_kana         | string  | null: false               |
| birthday                | date    | null: false               |

### Association
 - has_many :items
 - has_many :buyers

 
 ## Items Table

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| item_name          | string     | null:false        |
| description        | text       | null:false        |
| category_id        | integer    | null:false        |
| status_id          | integer    | null:false        |
| shipping_charge_id | integer    | null:false        |
| state_id           | integer    | null:false        |
| day_to_ship_id     | integer    | null:false        |
| price              | integer    | null:false        |
| user               | references | foreign_key: true |

 ### Association

 - belongs_to :user
 - has_one :order, dependent: :destroy


 ## Orders Table

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- | 
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |
| price            | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :Address, dependent: :destroy


## Address

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- | 
| postal_code      | string     | null: false       |
| state_id         | integer    | null: false       |
| city             | string     | null: false       |
| town             | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |

### Association

- belongs_to :order