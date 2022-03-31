class Order < ActiveRecord::Base
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items
    
    validates :order_items, presence: true
    validates :status, presence: true
    validates :client, presence: true

    scope :between, ->(start_date, end_date) { where(created_at: start_date..end_date) }
    def to_s
       "La commande #{id} de #{client}"
    end

    def total
        order_items.sum(&:price)
    end

    def self.most_expensive
        Order.find(OrderItem.group("order_id").order("sum_item_price_all_quantity DESC").sum("(item_price * quantity)").first.first)
    end
end