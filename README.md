## Users Table
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| last_name     | string  | null: false |
| first_name    | string  | null: false |
| last_name     | string  | null: false |
| first_name    | string  | null: false |
| year_of_birth | integer | null: false |
| year_of_birth | integer | null: false |
| year_of_birth | integer | null: false |

### Association
 - has_many :items
 - has_one :buyer, dependent: :destroy

 
 ## Items Table

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| image           | text       | null:false        |
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
| card_number      | integer    | null: false       |
| expiration_month | integer    | null: false       |
| expiration_day   | integer    | null: false       |
| security_code    | integer    | null: false       |
| user_id          | references | foreign_key: true |
| item_id          | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_information, dependent: :destroy


## Shipping_information

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- | 
| postal_code      | integer    | null: false       |
| state            | string     | null: false       |
| city             | string     | null: false       |
| address_line1    | string     | null: false       |
| address_line2    | string     | null: false       |
| phone_number     | integer    | null: false       |
| buyer_id         | references | foreign_key: true |

### Association

- belongs_to :buyer
