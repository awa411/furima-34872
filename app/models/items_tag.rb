class ItemsTag
  include ActiveModel::Model
  attr_accessor :images, :item_name, :description, :price, :category_id, :status_id, :shipping_charge_id, :state_id, :day_to_ship_id, :name, :user_id, :item_id

  with_options presence: true do
    validates :images
    validates :item_name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
    validates :user_id
    validates :name
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :state_id
    validates :day_to_ship_id
  end

  def save
    
    item = Item.create(images: images, item_name: item_name, description: description, price: price, category_id: category_id,
                        status_id: status_id, shipping_charge_id: shipping_charge_id, state_id: state_id, day_to_ship_id: day_to_ship_id, user_id: user_id)
    tag = Tag.create(name: name)

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end