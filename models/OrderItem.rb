class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    before_save :set_item_price
    before_create :take_from_stock
    before_update :update_stock
    
    validates :quantity, presence: true, numericality:{greater_or_equal_to: 1,only_integer: true}
    validates :order, presence: true
    validates :product, presence: true
    
    scope :bulk, ->(quantity=100) { where('quantity >= ?', quantity) }


    def take_from_stock
        enough_stock = product.enough_stock?(quantity)
        if enough_stock 
            product.stock -= quantity
            product.save
        else
            raise StandardError.new "Not enough stock available"
        end
    end

    def update_stock
        quantity_to_remove = (quantity-quantity_was)
        enough_stock = product.enough_stock?(quantity_to_remove)
        if enough_stock
            product.stock -= quantity_to_remove
            product.save
        else 
            raise StandardError.new "Not enough stock available"
        end
    end
    
    def to_s
        "#{quantity} #{product&.name} de #{order}" 
    end

    def price
        item_price * quantity
    end

    protected
    def set_item_price
        self.item_price=product.price if product
    end

    

end