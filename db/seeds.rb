# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Memorie.destroy_all
user = User.first
puts "Create Memories"
Memorie.create(title: "La découverte de l'Amérique par Christophe Colomb (1492)", description: "Revivez la découverte de l'Amérique : une aventure immersive et historique !", image: "amerique.jpg", user_id: user.id)
Memorie.create(title: "Le premier pas sur la Lune (1969) 🌕🚀", description: "Revivez le premier pas sur la Lune : une expérience lunaire inoubliable !", image: "Lune.jpg", user_id: user.id)
Memorie.create(title: "Le couronnement de Charlemagne (800 ap. J.-C.)", description: "Revivez le couronnement de Charlemagne : une plongée historique fascinante !", image: "Charlemagne.jpg", user_id: user.id)
Memorie.create(title: "La construction des pyramides d’Égypte (vers 2600 av. J.-C.) 🏗️🔺", description: "Revivez la construction des pyramides d’Égypte : une aventure historique captivante !", image: "Pyramide.jpg", user_id: user.id)
Memorie.create(title: "Le sacre de Napoléon à Notre-Dame (1804) 👑", description: "Revivez le sacre de Napoléon : une cérémonie impériale grandiose !", image: "nap.jpg", user_id: user.id)
Memorie.create(title: "L’Armistice du 11 novembre 1918 ☮️", description: "Revivez l'armistice de 1918 : un moment historique de paix !", image: "Armistice.jpg", user_id: user.id)
