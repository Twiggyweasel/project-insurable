class Room < ActiveRecord::Base
  belongs_to :home
  has_many :items
  
  validates :name, presence: true,
                   length: { in: 3 .. 50 }
                   
  
  def total_room_value
    items.sum(:value)
  end
  
  def item_count
    items.count
  end
end
