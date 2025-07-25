5.times do |i|
  # Criação do restaurante
  @restaurant = Restaurant.create!(
    name: "Restaurante Matutos #{i + 1}"
  )

  # Criação do endereço para o restaurante
  @restaurant_address = Address.create!(
    street: "Rua regente lima e silva #{i + 1}",
    number: "#{300 + i}",
    neighborhood: "Santa Rosa #{i + 1}",
    addressable: @restaurant  # Associando o endereço ao restaurante
  )
end
