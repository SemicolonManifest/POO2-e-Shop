class Client < ActiveRecord::Base
    has_many :orders
    has_many :products, through: :orders
    has_many :comments, foreign_key: :author_id

    def self.without_order
        where.missing(:orders)
    end

    def to_s
        name
    end
end