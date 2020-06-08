# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Auction.destroy_all
Bid.destroy_all

50.times do 
    a = Auction.create({
        title: Faker::Hacker.noun,
        description: Faker::Hacker.say_something_smart,
        date: Faker::Date.forward(days: 365*1),
        price: Faker::Number.between(from:10, to:99),
    })

    if a.valid? 
        rand(0..25).times.each do
            Bid.create(
                title: Faker::Number.between(from:10, to:99),
                auction: a,
                
            )
        end
    end

end

puts Cowsay.say("Generated #{Auction.count} Auctionss", :frogs)
puts Cowsay.say("Generated #{Bid.count} Bids", :cow)