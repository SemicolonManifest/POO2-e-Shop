class OrderItem < ActiveRecord::Base
    attr_accessor :quantity, :item_price
    belongs_to :order
    belongs_to :product
end