require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR')
sup = Category.create!(name: 'SUP')

client = Individual.create!(firstname: 'Theo', lastname: 'Gautier')
supplier = Supplier.create!(name: 'WorldSupplier')
company = Company.create!(name:'SuperCompnay')


product1 = Product.create!(name: 'apple', price: 1.0, description: 'Little apple', category: pcr,supplier:supplier,stock:2000)
product2 = Product.create!(name: 'lemon', price: 2.0, description: 'Big lemon', category: pcr,supplier:supplier,stock:2000)
product3 = Product.create!(name: 'limousine', price: 3.0, description: 'A limousine', category: sup,supplier:supplier,stock:2000)
product4 = Product.create!(name: 'truck', price: 4.0, description: 'A truck', category: sup,supplier:supplier,stock:2000)
product5 = Product.create!(name: 'Rock', price: 5.0, description: 'Rock', category: sup,supplier:supplier,stock:2000)

order1 = client.orders.create(status: 'PROGRESS', order_items: [
  OrderItem.new(quantity: 2, product: product1),
  OrderItem.new(quantity: 1, product: product3),
  OrderItem.new(quantity: 2, product: product4),
  OrderItem.new(quantity: 3, product: product5)
])

order2 = Order.new(status: 'PROGRESS',client:client)
order2.order_items << [
  OrderItem.new(quantity: 1, product: product1),
  OrderItem.new(quantity: 75, product: product2),
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 200, product: product4)
]
order2.save!
client.orders << order2
client.save!

comment = Comment.create!(body: 'Test comment', author: client, target: product1)
comment2 = Comment.create!(body: 'Super supplier', author: client, target: supplier)



puts '--SEEDERS DONE--'