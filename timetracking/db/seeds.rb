#Project.create!(name: 'Juan', description: 'I dont like potatoes')
#Project.create!(name: 'David', description: 'Solsticio de verano')
#Project.create!(name: 'Miguel', description: 'you wanna be my lover')
#Project.create!(name: 'Raul', description: 'I like surfing')
#Project.create!(name: 'Guli', description: 'Yo quiero vender mi alma')
#Project.create!(name: 'Sergio', description: 'Pues a mi me gusta hacer el vago')
#Project.create!(name: 'Nacho', description: 'A mi me gusta bailar salsa')
#Project.create!(name: 'Andres', description: 'Yo prefiero la bachata')
#Project.create!(name: 'Senen', description: 'Me encanta el señor de los anillos')
#Project.create!(name: 'Vinicio', description: 'Quiero ver la nueva peli de Harry Potter')

5.times do |index|
  project = Project.create!(name: "Cabify#{index}", 
                            description: "Description#{index}")
  2.times do |index2|
    project.time_entries.create(hours: index2,
                                minutes: index*index2,
                                date: Date.today,
                                comments: "Comment#{index2}")
  end
end