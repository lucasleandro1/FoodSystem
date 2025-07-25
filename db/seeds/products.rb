@restaurants = Restaurant.all

@restaurants.each do |restaurant|
  3.times do |j|
    Product.create!(
      name: "Prato #{j + 1} do #{restaurant.name}",
      description: "Delicioso prato número #{j + 1}",
      price: rand(10.0..50.0).round(2),
      restaurant: restaurant
    )
  end
end
