class Category < ActiveRecord::Base
    has_many :products
    has_many :orders, through: :products
    
    validates :name, presence: true

    def self.without_order
        where.not(id: joins(:orders).pluck(:id))
    end

    def to_s
        name
    end
end