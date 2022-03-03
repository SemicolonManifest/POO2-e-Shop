class Order < ActiveRecord::Base
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items

    scope :bulk, -> { where(quantity >= 100)}

    def to_s
       "La commande #{id} de #{client}"
    end
end