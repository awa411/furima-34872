class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :state
  belongs_to :day_to_ship
  with_options presence: true do
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[300-9999999]+\z/ }
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :state_id
    validates :day_to_ship_id
  end
  has_one_attached :image

end
