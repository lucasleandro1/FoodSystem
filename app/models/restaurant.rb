class Restaurant < ApplicationRecord
  belongs_to :address
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :name, presence: true
end
