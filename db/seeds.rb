# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
gift1 = Gift.create(title: "Doggie Snuggie", value: 20, description: "You can keep your dog warm while watching TV with you in this beautiful snuggie. Got it for Christmas, but my dog isn't having it.", brand: "Snuggie",  image: "/assets/1.jpg")
gift2 = Gift.create(title: "Christopher Walken Chia Pet", value: 30, description: "Christopher Walken Chia Head. Care for this handsome live plant and watch him blossom!", brand: "Ch-Ch-Ch-Chia",  image: "/assets/2.png")
gift3 = Gift.create(title: "Leaping Kitten Shirt", value: 20, description: "Men's t-shirt. Size: Extra Large. Kitten looks fierce.", brand: "Unknown",  image: "/assets/3.jpg")
gift4 = Gift.create(title: "Feathered Hat", value: 40, description: "Men's felt hat with a red feather.", image: "/assets/4.jpg")
gift5 = Gift.create(title: "Black Gloves with Cheetah Lining", value: 35, description: "Fancy women's gloves. Size medium. They have a shiny black bow on the side.", brand: "Furrberry", image: "/assets/5.jpg")
gift6 = Gift.create(title: "Tamagotchi Friend", value: 20, description: "Classic toy! Enjoy having a pet without the hassle of cleaning up poop.", image: "/assets/6.jpg")
gift7 = Gift.create(title: "Oster Breadmaker", value: 50, description: "Who doesn't love the smell of homemade bread? I would keep this gift but I already have one.", brand: "Oster", image: "/assets/7.jpg")
