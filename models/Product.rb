class Product < ActiveRecord::Base
    has_many :order_items
    has_many :orders, through: :order_items
    belongs_to :category
    belongs_to :supplier
    has_many :comment, as: :target

    after_initialize :init
    after_save :send_mail_if_low_on_stock

    validates :name, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :category, presence: true
    validates :supplier, presence: true
    validates :stock, presence: true

    scope :cheap, -> { where('price <= 0.20')}

    def enough_stock?(quantity)
        stock>quantity
    end

    def send_mail_if_low_on_stock
        if stock < 5
            Mailer.send_message(subject:"Low #{name}'s stock", body:"The stock is currently running low on #{name}. #{stock} remaining.", from:"eshop@theo.com", to:"theo.gautier@cpnv.ch")
        end
    end


    def init
        self.stock ||= 0
    end

    def to_s
        name
    end
end