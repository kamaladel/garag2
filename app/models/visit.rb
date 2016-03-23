class Visit < ActiveRecord::Base
has_and_belongs_to_many :items
#has_many :items, through: :carts
belongs_to :owner

end
