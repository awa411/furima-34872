class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :state
  belongs_to :day_to_ship
  belongs_to :user
  
  has_many_attached :images
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations
  has_many :messages, dependent: :destroy

end
