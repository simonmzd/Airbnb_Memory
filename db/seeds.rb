Memorie.destroy_all
User.destroy_all

mel = User.create(email: "melanie.lepage86@hotmail.fr", password: "Mémory")
simon = User.create(email: "mazaudsimon@gmail.com", password: "memory")
quentin = User.create(email: "sainton.quentin86@gmail.com", password: "Memory")

memorie_1 = Memorie.create(
  date: Date.new(1492, 1, 1),
  location: "Etats-Unis",
  title: "La découverte de l'Amérique par Christophe Colomb",
  description: "Revivez la découverte de l'Amérique : une aventure immersive et historique !",
  image: "amerique.jpg",
  user: mel
)

memorie_2 = Memorie.create(
  date: Date.new(1969, 7, 20),
  location: "Lune",
  title: "Le premier pas sur la Lune 🌕🚀",
  description: "Revivez le premier pas sur la Lune : une expérience lunaire inoubliable !",
  image: "Lune.jpg",
  user: quentin
)

memorie_3 = Memorie.create(
  date: Date.new(800, 12, 25),
  location: "Rome, Italie",
  title: "Le couronnement de Charlemagne",
  description: "Revivez le couronnement de Charlemagne : une plongée historique fascinante !",
  image: "Charlemagne.jpg",
  user: simon
)

memorie_4 = Memorie.create(
  date: Date.new(-2600, 1, 1),
  location: "Gizeh, Egypte",
  title: "La construction des pyramides d’Égypte 🏗️🔺",
  description: "Revivez la construction des pyramides d’Égypte : une aventure historique captivante !",
  image: "Pyramide.jpg",
  user: mel
)

memorie_5 = Memorie.create(
  date: Date.new(1804, 12, 2),
  location: "Paris, France",
  title: "Le sacre de Napoléon à Notre-Dame 👑",
  description: "Revivez le sacre de Napoléon : une cérémonie impériale grandiose !",
  image: "nap.jpg",
  user: quentin
)

memorie_6 = Memorie.create(
  date: Date.new(1918, 11, 11),
  location: "France",
  title: "L’Armistice de la 2nde Guerre Mondiale ☮️",
  description: "Revivez l'armistice de 1918 : un moment historique de paix !",
  image: "Armistice.jpg",
  user: simon
)

file = File.open(File.join(Rails.root,'app/assets/images/amerique.jpg'))
memorie_1.images.attach(io: file, filename: "nes.png", content_type: "image/png")
memorie_1.save
puts "memorie_1 saved"

file = File.open(File.join(Rails.root,'app/assets/images/Lune.jpg'))
memorie_2.images.attach(io: file, filename: "nes.png", content_type: "image/png")
memorie_2.save
puts "memorie_2 saved"

file = File.open(File.join(Rails.root,'app/assets/images/Charlemagne.jpg'))
memorie_3.images.attach(io: file, filename: "nes.png", content_type: "image/png")
memorie_3.save
puts "memorie_3 saved"

file = File.open(File.join(Rails.root,'app/assets/images/Pyramide.jpg'))
memorie_4.images.attach(io: file, filename: "nes.png", content_type: "image/png")
memorie_4.save
puts "memorie_4 saved"

file = File.open(File.join(Rails.root,'app/assets/images/nap.jpg'))
memorie_5.images.attach(io: file, filename: "nes.png", content_type: "image/png")
memorie_5.save
puts "memorie_5 saved"

file = File.open(File.join(Rails.root,'app/assets/images/Armistice.jpg'))
memorie_6.images.attach(io: file, filename: "nes.png", content_type: "image/png")
memorie_6.save
puts "memorie_6 saved"
