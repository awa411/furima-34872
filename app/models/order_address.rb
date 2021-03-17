class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :state_id, :postal_code, :city, :town, :building, :phone_number, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :town
    validates :phone_number, format: {with: /\A\d{,11}\z/ }
    validates :user_id
    validates :item_id
    validates :state_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, state_id: state_id, city: city, town: town, building: building, phone_number: phone_number, order_id: order.id)
  end
end