class Restaurant < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :name, presence: true
end
