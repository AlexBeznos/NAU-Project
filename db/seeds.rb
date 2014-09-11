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

Admin.create(email: ENV['ADMIN_MAIL'], password: ENV['ADMIN_PASS'])

puts %q{
++++++++++++++++++++
      Finish!!!
++++++++++++++++++++
}


