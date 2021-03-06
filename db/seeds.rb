# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'faker'
require "open-uri"
User.destroy_all
Car.destroy_all
Rental.destroy_all

# 20.times do
#   User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
#               email: Faker::Internet.email, password: 'test123')
# end

# 20.times do
#   Car.create(brand: Faker::Vehicle.manufacture, model: Faker::Vehicle.model, price: rand(50..100),
#              user: User.all.sample)
# end

# 50.times do
#   # Random date in current year
#   date = Faker::Date.in_date_period
#   user = User.all.sample
#   # we are filtering out the cars that belong to an individual user
#   our_car = Car.all.reject { |car| car.user === user }.sample
#   Rental.create(rental_begin: date, rental_end: date + rand(1..10), user: user, car: our_car)
# end

user_data = [
  {
    first_name: "Max",
    last_name: "Mueller",
    email: "max.mueller@gmail.com",
    password:"123456",
    slug: "dgs",
  },

  {
    first_name: "Werner",
    last_name: "Schmidt",
    email: "Werner.Schmidt@gmail.com",
    password:"123456",
    slug: "dgs1",
  },

  {
    first_name: "Mariana",
    last_name: "Dysonhofer",
    email: "Mariana.Dysonhofer@gmail.com",
    password:"123456",
    slug: "dgs2",
  },

  {
    first_name: "Julian",
    last_name: "Gruber",
    email: "Julian.Gruber@gmail.com",
    password:"123456",
    slug: "dgs3",
  } ,

  {
    first_name: "Jan",
    last_name: "Ophey",
    email: "Jan.Ophey@gmail.com",
    password:"123456",
    slug: "dgs4",
  },

  {
    first_name: "Burkhard",
    last_name: "Scholz",
    email: "Burkhard.Scholz@gmail.com",
    password:"123456",
    slug: "dgs5",
  }
]
 users = {}

# slug is a technique to quickly identify the associated user data

user_data.each do |data|
  user = User.new(first_name: data[:first_name], last_name: data[:last_name], email: data[:email], password: data[:password])
  slug = data[:slug]
  users[slug] = user
end
#car_data has all the values of car model

car_data = [
  {
    brand: "Triumph",
    model: "Tr3",
    price: 300,
    description: "Mod??le 66 en tr??s bon ??tat. Couleur cr??me (int??rieur, ext??rieur et capote) qui souligne encore plus son ??l??gance et son raffinement. V8 289 ci (4,7 L), boite automatique, capote ??lectrique, direction assist??e, freins ?? disque ?? l'avant. Double ligne d'??chappement pour une sonorit?? envo??tante. Une...",
    user: users["dgs"],
    img_url: "https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/triumph-tr3-puteaux-4ae7c10945280975b1b8dc5f3af64a62.webp"
  },

  {
    brand: "Ford",
    model: "Mustang Cabriolet",
    price: 400,
    description:"Mod??le 66 en tr??s bon ??tat. Couleur cr??me (int??rieur, ext??rieur et capote) qui souligne encore plus son ??l??gance et son raffinement. V8 289 ci (4,7 L), boite automatique, capote ??lectrique, direction assist??e, freins ?? disque ?? l'avant. Double ligne d'??chappement pour une sonorit?? envo??tante. Une...",
    user: users["dgs2"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/ford-mustang-cabriolet-1ere-gen-paris-f761b39c2c43dac673798906d3c7b116.webp"
  },

  {
    brand: "Alfa Romeo",
    model: "Spider Coda Tronca",
    price: 300,
    description:"Proche m??tro La D??fense (ligne 1). Forfait week-end du samedi matin au lundi matin (pas le dimanche).
    La ?? vous avec cette magnifique Alfa spider de 1973 ! Vous pourrez profiter l???espace d???un week-end de la sonorit?? du fabuleux 4 cylindres en ligne de 2 litres et de sa cav...",
    user: users["dgs3"],
    img_url: "https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/alfa-romeo-spider-coda-tronca-courbevoie-62b2534683b9480b6a54aefc858e3338.webp"
  },

  {
    brand: "Triumph",
    model: "Spitfire Mk4",
    price: 350,
    description: "Le prix indiqu?? est lors de la saison basse de octobre ?? avril inclus.Pas de location 24h durant les Week-ends, forfait du vendredi aprem au dimanche",
    user: users["dgs5"],
    img_url: "https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/triumph-spitfire-mk4-rouge-aix-en-provence-e5c7f62cda79e91122ed02932668db0e.webp"
  },

  {
    brand: "Alfa Romeo",
    model: "Gt 1600 Junior ",
    price: 250,
    description: "Proche m??tro La D??fense (ligne 1). Forfait week-end du samedi matin au lundi matin (pas le dimanche).
    Avec sa livr??e bleu Francia et ses phares jaunes, ce coup?? Bertone GT Junior 1600 de 1975 vous enchantera tant pour son esth??tique que pour le son m??lodieux de son fameux 4 cylindres en ligne....",
    user: users["dgs1"],
    img_url: "https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/alfa-romeo-gt-1600-junior-courbevoie-5ccb3de33abb25888b7b8df33609a815.webp"
  },

  {
    brand: "Citroen",
    model: "2cv",
    price: 150,
    description:"2CV coup de coeur bleue et blanche ...parfait etat mecanique et interieur.
    Superbe sous un petit rayon de soleil, avec un tenue estivale, une robe de mariee, pour un moment inoubliable, balade, week end , decouverte ... Les photos suffiront a vous seduire.",
    user: users["dgs5"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/citroen-2cv-bleue-mareil-marly-9d66e51fa6f915b9796ab3f913a80e6b.webp"
  },

  {
    brand:"Ford" ,
    model:"Mustang" ,
    price: 300,
    description:"Ford Mustang 66 bleue avec son int??rieur bleu en bon ??tat et son 6 cylindres en ligne id??al pour cruiser sur les routes girondines ! V??hicule en provenance directe des us qui saura vous charmer avec sa bo??te auto tr??s souple sa sonorit?? velout??e et sa consommation tr??s raisonnable  (environ 10l a...",
    user: users["dgs"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/ford-mustang-1ere-gen-saint-andre-de-cubzac-2f1f032e2c086b287ec91389963c49b2.webp"
  },

  {
    brand: "Morgan",
    model: "Tourer de 1989",
    price: 400,
    description: "Morgan Cabriolet, propos??e ?? la location dans la r??gion de Lyon. Simple ?? prendre en main. Int??rieur en cuir beige. La banquette arri??re permet ?? 2 adultes (pas trop grands ni trop ) de prendre place. La voiture dispose d'une capote et de side screens en cas de pluieAttention, le tari...",
    user: users["dgs4"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/morgan-tourer-vaulx-en-velin-14ac36b704833a4c2d5a038aa4421a29.webp"
  },

  {
    brand:"Triumph" ,
    model: "Tr3",
    price: 300,
    description: "Proche m??tro La D??fense (ligne 1). Forfait week-end du samedi matin au lundi matin (pas le dimanche).V??hicule de collection TR3 A, noir, int??rieur rouge brique, enti??rement restaur??e depuis le ch??ssis en 2012, ??tat concours. Johnny Halliday a poss??d?? le m??me mod??le. Tr??s agr??able ?? conduire, ...",
    user: users["dgs5"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/triumph-tr3-a-courbevoie-8d64ddd45f65ab3f063c928bdbf1ea06.webp"
  },

  {
    brand: "Porsche",
    model: "912 Targa",
    price: 250,
    description: "Proche m??tro La D??fense (ligne 1). Forfait week-end du samedi matin au lundi matin (pas le dimanche).
    Porsche 912 Targa de 1969, elle dispose d'une rare bo??te 5 vitesses. Elle a ??t?? compl??tement restaur??e et elle est disponible ?? Paris pour vos week-ends. Une ligne ?? couper le souffle et une tr??s belle sonorit?? du gr??ce ?? l??chappement.",
    user: users["dgs2"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/porsche-912-targa-courbevoie-803d7411fb8a0212de97b378283c1e7d.webp"
  },

  {
    brand: "Citroen ",
    model: "2Cv",
    price: 200,
    description:"Superbe 2CV Charleston de premi??re g??n??ration, m??canique et peinture refaites a neuf en 2015. Int??rieur nickel, moteur optimise pour confort de conduite accru. Plaisir de la deuche, du cabriolet et classe de cette version. Pour mariage, week end, visite ludique de la r??gion",
    user: users["dgs"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/citroen-2cv-charleston-mareil-marly-57e975149e3fdba4a4f9acf2e6487f34.webp"
  },

  {
    brand: "Jaguar",
    model: "Panther",
    price: 250,
    description:"La PANTHER J 72 est la 1??re voiture construite par Robert JANKEL en 1972, sur les bases d'une JAGUAR, 368 exemplaires ont ??t?? construits de 1972 ?? 1982 celle que je propose ?? la location est une version 2 il en a ??t?? fabriqu?? 161 elle est de 1982 c'est une des derni??res qui a ??t?? produite.",
    user: users["dgs3"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/jaguar-panther-j-72-saint-ave-5624c4943dc822ecd68689d62dbe9821.webp"
  },

  {
    brand: "Peugeot",
    model: "404 Berline",
    price: 350,
    description:"Peugeot 404 noire int??rieur sky rouge, volant en bakelite
    La voiture est en parfait ??tat ext??rieur comme int??rieur
    Tr??s agr??able ?? conduire elle est id??ale pour les mariages
    A noter, absence de ceintures de s??curit??",
    user: users["dgs1"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/peugeot-404-berline-paris-49e5f322316318a9a1b7c6d4b93f79fc.webp"
  },

  {
    brand: "Fiat ",
    model: "850 Sport Spider",
    price: 300,
    description: "historique Cette petite d??capotable repose sur une id??e originale du designer italien Bertone dont l'auteur est le tr??s jeune dessinateur Giorgetto Giugiaro.",
    user: users["dgs"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/fiat-850-sport-spider-angers-4eee72b934012e60afda834027a21eb9.webp"
  },

  {
    brand: "Volkswagen ",
    model: "Beetle",
    price: 500,
    description: "Mythe roulant et v??ritable monument de l'Automobile, la Volkswagen Coccinelle lanc??e en 1938 est la voiture la plus vendue au monde. Les lignes rondes et douces soulign??es par des baguettes qui habillent la t??le donnent ?? la une ??l??gance et un capital sympathie qui traversent les g??n??rations.",
    user: users["dgs5"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/volkswagen-vw-coccinelle-1200-blanche-aix-en-provence-d6df073847a95c138bb425f71a5e2de1.webp"
  },

  {
    brand:"Citroen " ,
    model: "DS",
    price: 200,
    description:"A louer avec chauffeur sympa, ??l??gant et discret pour vos ??v??nements, promenades, mariages, tournages de films, s??ance photos ou pour expos ou foires.
    Pour vous faciliter, je peux vous livrer la voiture o?? vous le souhaitez.",
    user: users["dgs2"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/citroen-ds-paris-a68c9aa9ba464dadbdb17b6337b86422.webp"
  },

  {
    brand: "Mg",
    model: "Mga Roadster",
    price: 200,
    description:"La MGA de la marque Morris Garage (MG) est tout ?? fait typique du d??but des ann??es cinquante. Son allure g??n??rale est celle des cabriolets sportifs de cette ??poque, avec une ligne basse ?? la fois tendue et sensuelle, h??sitant entre a??rodynamisme et tradition. Elle a rencontr?? le succ??s",
    user: users["dgs4"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/mg-mga-roadster-bayonne-33facc73dffd515099d8af74fc84a5e1.webp"
  },

  {
    brand: "Ferrari ",
    model: "F355 ",
    price: 400,
    description:"Forfait chauffeur en suppl??ment avec la possibilit?? de conduire en toute autonomie derri??re le volant, je vous accompagnerais sur nos plus belles routes avec une initiation au base de pilotage, repas et bonne humeur entre passionn??s.
    Ceci est un premier mod??le avec Motronic 2.7 et ABS d??connectable (Le Must). Boite m??canique, la fameuse grille.
    Restauration compl??te int??rieur, ext??rieur et m??canique, tout est fonctionnel dans cette auto ",
    user: users["dgs"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/ferrari-f355-bordeaux-f00706017d44671b667159e9fd390246.webp"
  },

  {
    brand: "Jeep ",
    model:"Wrangler" ,
    price: 200,
    description:"Le Jeep Wrangler JK toiture en toile, est un v??hicule id??al pour profiter du soleil et de la nature tropicale.
    Avec sa motorisation V6 essence de 199cv, Il offre du 3 en 1: un v??hicule tout-terrain, puissant, et la joie du cabriolet.
    Son allure et sa couleur orange invite ?? l'aventure et la",
    user: users["dgs3"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/jeep-wrangler-3-8-litres-essence-v6-199cv-baie-mahault-1496e1d5ffd4bbbe619c4b44eaf668ad.webp"
  },

  {
    brand: "Mercedes-benz",
    model: "280 Sl",
    price: 600,
    description:"Cabriolet Mercedes 280 SL, type R107
    Couleur Champagne, int??rieur Cognac
    Bo??te automatique. Climatisation. ",
    user: users["dgs2"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/mercedes-benz-280-sl-massac-seran-87816320fd276b5881ab16d6684a6d19.webp"
  },

  {
    brand:"Mercedes-benz" ,
    model: "380 Sl",
    price: 400,
    description:"Restaur??e compl??tement ! Peinture neuve dans un superbe ??tat .Controle Technique Ok. Mod??le V8 de 3.8 litres de 145 cv DIN , id??al pour des balades ou un week end cheveux au vent!Carte grise collection (2 places) ?? mon nom",
    user: users["dgs"],
    img_url:"https://roadstr.s3.eu-west-1.amazonaws.com/production/car_pictures/large_webp/mercedes-benz-380-sl-asnieres-sur-seine-4cb220c41b10dc2193fbbadbe72626b8.webp"
  }
]

#go through each car_data and create car object

car_data.each do |data|
  car = Car.new(brand: data[:brand], model: data[:model], price: data[:price], user: data[:user], description: data[:description])
  file = URI.open(data[:img_url])
  car.photo.attach(io: file, filename: 'car.png', content_type: 'image/png')
  car.save!
end
