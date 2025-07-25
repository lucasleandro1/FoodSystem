class Address < ApplicationRecord
  belongs_to :user
  has_one :restaurant

  validates :street, :number, :neighborhood, presence: true
end
