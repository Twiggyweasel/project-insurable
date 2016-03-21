class Room < ActiveRecord::Base
  belongs_to :home
  has_many :items
  
  validates :name, presence: true, length: { minimum: 3 }
end
