require_relative('../models/student')
require_relative('../models/house')
require( 'pry-byebug' )

Student.delete_all()
House.delete_all()


house1 = House.new({
  'house_name' => 'Gryffindor',
  'logo' =>  'https://i.pinimg.com/originals/d1/e8/53/d1e853a51cc4f6b25a9f96914e04b992.png'
})
house2 = House.new({
  'house_name' => 'Slytherin',
  'logo' =>  'https://vignette.wikia.nocookie.net/harrypotter/images/e/ef/Slytherin%E2%84%A2_Crest_%28Painting%29.png/revision/latest?cb=20091129190321'
})

house3 = House.new({
  'house_name' => 'Ravenclaw',
  'logo' =>  'https://vignette.wikia.nocookie.net/harrypotter/images/6/6c/Ravenclaw%E2%84%A2_Crest_%28Painting%29.png/revision/latest?cb=20091129184403'
})

house4 = House.new({
  'house_name' => 'Hufflepuff',
  'logo' =>  'https://vignette.wikia.nocookie.net/harrypotter/images/3/30/Hufflepuff%E2%84%A2_Crest_%28Painting%29.png/revision/latest?cb=20091129184403'
})

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house_id' => house1.id,
  'age' =>  '16'
})

student2 = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'house_id' => house1.id,
  'age' =>  '15'
})

student3 = Student.new({
  'first_name' => 'Dracko',
  'last_name' => 'Malfoy',
  'house_id' => house2.id,
  'age' =>  '18'
})

student4 = Student.new({
  'first_name' => 'Luna',
  'last_name' => 'Lovejoy',
  'house_id' => house4.id,
  'age' =>  '16'
})

student5 = Student.new({
  'first_name' => 'Cedric',
  'last_name' => 'Diggery',
  'house_id' => house3.id,
  'age' =>  '17'
})

student1.save()
student2.save()
student3.save()
student4.save()
student5.save()



binding.pry
nil
