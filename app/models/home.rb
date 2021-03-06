class Home < ActiveRecord::Base
  has_many :rooms
  has_many :items, through: :rooms
  
  validates :name, presence: true
end
