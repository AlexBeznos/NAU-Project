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

Document.create(name: "Реєстр документів НАУ", doc_path: "some_path")
Document.create(name: "Реєстр форм НАУ", doc_path: "some_pat")
Document.create(name: "Форми документів НАУ", doc_path: "some_pah")
Document.create(name: "Настанова з якості НАУ", doc_path: "some_ath")
Document.create(name: 'Документована процедура "Управління документацією"', doc_path: "some_pth")
Document.create(name: "Документована процедура управління", doc_path: "somepath")
Document.create(name: "Звіт вищого керівництва з якості", doc_path: "som_path")
Document.create(name: "Рейтинг структурних підрозділів", doc_path: "sme_path")

print "Documents creations is done, start making reletions..."
Category.all.each do |category|
	category.documents << Document.find(1)
	category.documents << Document.find(2)
	category.documents << Document.find(4)
	category.documents << Document.find(5)
	category.documents << Document.find(6)
end
Category.find(3).documents << Document.find(3)
Category.find(1).documents << Document.find(7)
Category.find(2).documents << Document.find(8)

puts %q{
++++++++++++++++++++
      Finish!!!
++++++++++++++++++++
}


