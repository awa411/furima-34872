## Users Table
| Column                  | Type    | Options                   |
| ----------------------- | ------- | ------------------------- |
| nickname                | string  | null: false               |
| email                   | string  | null: false, unique: true |
| encrypted_password      | string  | null: false               |
| last_name               | string  | null: false               |
| first_name              | string  | null: false               |
| last_name               | string  | null: false               |
| first_name              | string  | null: false               |
| birthday                | date    | null: false               |

### Association
 - has_many :items
 - has_many :buyers

 
 ## Items Table

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| item_name       | string     | null:false        |
| about           | text       | null:false        |
| category        | string     | null:false        |
| status          | string     | null:false        |
| shipping_charge | string     | null:false        |
| shipment_area   | string     | null:false        |
| day_to_ship     | string     | null:false        |
| price           | integer    | null:false        |
| user_id         | references | foreign_key: true |

 ### Association

 - belongs_to :user
 - has_one :buyer, dependent: :destroy


 ## Buyers Table

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- | 
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_information, dependent: :destroy


## Shipping_information

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- | 
| postal_code      | string     | null: false       |
| state            | string     | null: false       |
| city             | string     | null: false       |
| town             | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |
| buyer_id         | references | foreign_key: true |

### Association

- belongs_to :buyer
