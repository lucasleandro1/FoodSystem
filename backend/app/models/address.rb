class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :street, :number, :neighborhood, presence: true
end
