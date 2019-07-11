class Item < ApplicationRecord
    validates :item, presence: true, length: {maximum: 100 }
    validates :note, presence: true, length: {maximum: 500 }
    validates :price, presence: true
end
