print "I'm starting..."

Category.create(name: "Керівництво")
Category.create(name: "Керівництво структурних підрозділів")
Category.create(name: "Співробітник")
Category.create(name: "Аудитор")
Category.create(name: "Відповідальний з якості")

puts %q{
++++++++++++++++++++++++++++++++
  Categories creation is done)
++++++++++++++++++++++++++++++++
}

<<<<<<< HEAD
Admin.create(email: "beznosa@yahoo.com", password: "0937003321Oli")
=======
Admin.create(email: 'beznosa@yahoo.com', password: '0937003321Oli')

>>>>>>> ff002c58b0ab92e9f703f1d8767cba338911fe68
puts %q{
++++++++++++++++++++
      Finish!!!
++++++++++++++++++++
}


