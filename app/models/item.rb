class Item < ApplicationRecord
  with options presence: true
    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :state_id
    validates :day_to_ship_id
    validates :price, format: { with: /\A[300-9999999]+\z/ }

end
