class Order < ActiveRecord::Base
    belongs_to :client
    has_many :products, through: :order_items
end