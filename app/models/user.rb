class User < ActiveRecord::Base
  has_many :tools, dependent: :destroy
end
