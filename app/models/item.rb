class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :state
  belongs_to :day_to_ship
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
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
