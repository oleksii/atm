# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
denom_list = [
  [ "One", 1 ],
  [ "Two", 2 ],
  [ "Five", 5 ],
  [ "Ten", 10 ],
  [ "TwentyFive", 25 ],
  [ "Fifty", 50 ]
]

denom_list.each do |type, denom|
  Coin.create( type: type, denom: denom, amount: 0 )
end
