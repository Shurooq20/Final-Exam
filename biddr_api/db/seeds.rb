# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Auction.destroy_all
Bid.destroy_all
User.delete_all

NUM_USER = 10
PASSWORD = 'shurooq20'


super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

NUM_USER.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end


users = User.all 

50.times do 
    a = Auction.create({
        title: Faker::Hacker.noun,
        description: Faker::Hacker.say_something_smart,
        date: Faker::Date.forward(days: 365*1),
        price: Faker::Number.between(from:10, to:99),
        user: users.sample,
    })

    if a.valid? 
        rand(0..25).times.each do
            Bid.create(
                title: Faker::Number.between(from:10, to:99),
                auction: a,
                user: users.sample,
                
            )
        end
    end

end

puts Cowsay.say("Generated #{Auction.count} Auctionss", :frogs)
puts Cowsay.say("Generated #{Bid.count} Bids", :cow)
puts Cowsay.say("Created #{users.count}  users", :dragon)
