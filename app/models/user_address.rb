class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to :state
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :town
    validates :phone_number, format: {with: /\A\d{,11}\z/ }
    validates :state_id
  end
end
