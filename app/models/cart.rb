class Cart < ActiveRecord::Base
belongs_to :visit
belongs_to :item
end
