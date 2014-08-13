class CategoriesDocuments < ActiveRecord::Migration
  def change
  	create_table :categories_documents do |f|
  		f.integer :category_id
  		f.integer :document_id
  	end
  end
end
