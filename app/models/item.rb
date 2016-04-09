class Item < ActiveRecord::Base
  belongs_to :room
  
  validates :name, presence: true,
                   length: { in: 3 .. 50 }
                   
  validates :value, presence: true,
                    :numericality => { :greater_than_or_equal_to => 1, message: "Item must have a value greater than 0" }
end
