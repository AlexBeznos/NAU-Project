%x[rake db:rollback]
%x[rake db:rollback]
%x[rake db:rollback]
%x[rake db:rollback]
%x[rake db:migrate]

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

Admin.create(email: "beznosa@yahoo.com", password: "0937003321Oli")
puts %q{
++++++++++++++++++++
      Finish!!!
++++++++++++++++++++
}


