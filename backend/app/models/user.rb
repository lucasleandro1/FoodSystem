class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :email, uniqueness: true
end
