Product.destroy_all
Client.destroy_all
User.destroy_all


puts "base vidée"

require 'faker'

User.create!(
    lastname: "Chabreuil",
    firstname: "antoine",
    password: "123456",
    role: "Admin",
    tel: "06 25 56 56 56",
    email: "coco@gmail.com",
    comment: "Compte admin"
)

user = User.create!(
    lastname: Faker::Name.name,
    firstname: Faker::Name.first_name,
    password: "123456",
    tel: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    comment: "Lorem"
)

client = Client.create!(
    username: Faker::Name.name,
    lastname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    mail: Faker::Internet.email,
    comment: "Lorem",
    actif: Faker::Boolean.boolean,
    user_id: user.id
)

10.times do |i|
    Product.create!(
        name: Faker::Book.title,
        number: Faker::Number.number(digits: 3),
        client_id: client.id,
        deliveryDate: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'),
        onSite: Faker::Boolean.boolean,
    )
end

puts "users créés"