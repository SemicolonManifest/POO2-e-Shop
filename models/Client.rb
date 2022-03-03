class Client < ActiveRecord::Base
    has_many :orders

    def to_s
        "(#{id}) #{firstname} #{lastname}"
    end
end