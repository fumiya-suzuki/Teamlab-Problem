class Company < ApplicationRecord
    validates :name, presence: true,uniqueness: true
    
    def items
        Item.where(company_id: self.id)
    end
end
