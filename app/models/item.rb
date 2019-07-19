class Item < ApplicationRecord
    validates :item, presence: true, length: {maximum: 100 }
    validates :note, presence: true, length: {maximum: 500 }
    validates :price, presence: true
    validates :company_id, presence: true

    def self.search(search)
        if search
            Item.where(['item LIKE ?', "%#{search}%"])
        else
            Item.all
        end
    end
    
    def items
        Item.where(company_id: self.id)
    end
    
    def company
        Company.find(self.company_id)
    end
    
end
