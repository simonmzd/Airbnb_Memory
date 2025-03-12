Memorie.destroy_all
user = User.first
puts "Create Memories"
memorie_1 = Memorie.create(title: "La découverte de l'Amérique par Christophe Colomb (1492)", description: "Revivez la découverte de l'Amérique : une aventure immersive et historique !", image: "amerique.jpg", user_id: user.id)
memorie_2 = Memorie.create(title: "Le premier pas sur la Lune (1969) 🌕🚀", description: "Revivez le premier pas sur la Lune : une expérience lunaire inoubliable !", image: "Lune.jpg", user_id: user.id)
memorie_3 = Memorie.create(title: "Le couronnement de Charlemagne (800 ap. J.-C.)", description: "Revivez le couronnement de Charlemagne : une plongée historique fascinante !", image: "Charlemagne.jpg", user_id: user.id)
memorie_4 = Memorie.create(title: "La construction des pyramides d’Égypte (vers 2600 av. J.-C.) 🏗️🔺", description: "Revivez la construction des pyramides d’Égypte : une aventure historique captivante !", image: "Pyramide.jpg", user_id: user.id)
memorie_5 = Memorie.create(title: "Le sacre de Napoléon à Notre-Dame (1804) 👑", description: "Revivez le sacre de Napoléon : une cérémonie impériale grandiose !", image: "nap.jpg", user_id: user.id)
memorie_6 = Memorie.create(title: "L’Armistice du 11 novembre 1918 ☮️", description: "Revivez l'armistice de 1918 : un moment historique de paix !", image: "Armistice.jpg", user_id: user.id)


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
