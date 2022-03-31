class Comment < ActiveRecord::Base
    belongs_to :author, class_name: 'Client'
    belongs_to :target, polymorphic: true

    validates :author, presence: true
    validates :target, presence: true
    validates :body, presence: true

    def to_s
       "#{author}: #{body}"
    end
end