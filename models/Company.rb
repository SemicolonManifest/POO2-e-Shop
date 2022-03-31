class Company < Client
    validates :name , presence: true,length: {minimum:3}
end