2.times do |i|
  # Criação do usuário
  @user = User.create!(
    email: "exemplo#{i + 1}@teste.com",  # Cria emails únicos
    password: "123456"
  )

  # Criação do endereço para o usuário
  @user_address = Address.create!(
    street: "Rua das Flores #{i + 1}",
    number: "#{100 + i}",
    neighborhood: "Centro #{i + 1}",
    addressable: @user  # Associando o endereço ao usuário
  )
end
