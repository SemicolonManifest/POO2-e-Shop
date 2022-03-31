require_relative 'connection'
require_relative 'models'

ActiveRecord::Base.connection.execute("SELECT 1")

client = Individual.find(1)
supplier = Supplier.find(1)

puts "### produits dont le prix est de -.20 ou moins"
client.products.cheap.each do |product|
    puts "\t #{product} trouvé dans la commande de #{client} "
end
puts "### Produits commandé par 50 pièces ou plus"
puts "\t#{ OrderItem.bulk(50).map(&:product).join(", ") }"

puts "\n### Exigance 4"
order = Order.new(client: client,status:'PROGRESS', order_items: [])
print "\t#### 1\n\t"
puts order.save

print "\t#### 2\n\t"
order.order_items.build
puts order.save

print "\t#### 3\n\t"
order.order_items.build(quantity:10)
puts order.save

print "\t#### 4\n\t"
order.order_items.build(product:Product.first)
puts order.save

puts "\n### Exigance 5"
print "\t"
correctOrder = client.orders.find(1)
puts "Somme: #{correctOrder.total}"

puts "\n### Exigance 7"
print "\t"
puts supplier.products.join(", ")

puts "\n### Exigance 8"
print "\t"
puts Comment.find(1)

puts "\n### Exigance 9"
print "\t"

product = Product.find(1)

puts "#{product}:#{product.stock}"

order1 = client.orders.create(status: 'PROGRESS', order_items: [
    OrderItem.new(quantity: 2, product: product),
  ])

puts "#{product}:#{product.stock}"

order1.order_items[0].quantity =0
order1.order_items[0].save

puts "#{product}:#{product.stock}"

#order2 = client.orders.create(status: 'PROGRESS', order_items: [OrderItem.new(quantity: 1994, product: product),])
puts "dernière étape désactivée"
  puts "\n### Exigance 10"
print "\t"

puts "\n### Exigance 10"
print "\t"
puts Order.most_expensive

puts "\n### Exigance 11"
print "\t"
 puts Category.without_order.join(", ")

 puts "\n### Exigance 12"
print "\t"
 puts Client.without_order.join(", ")
 puts Client.without_order.destroy_all

 puts "\n### Exigance 13"
 print "\t"
starts_at = Time.now - 1.week
ends_at = starts_at + 6.day
puts Order.between(starts_at, ends_at).map(&:id).join(", ")

