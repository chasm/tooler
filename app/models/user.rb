class User < ActiveRecord::Base
  has_many :tools, dependent: :destroy

  attr_accessor :password, :password_confirmation

  validates :email, presence: true
  validates :email, uniqueness: true
end
