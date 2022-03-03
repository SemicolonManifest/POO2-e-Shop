class OrderItem < ActiveRecord::Base
    attr_accessor :quantity, :item_price
    belongs_to :order
    belongs_to :product


    def to_s
        "#{quantity} #{name} de #{order}" 
    end
end