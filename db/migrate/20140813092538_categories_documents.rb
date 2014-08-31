class CategoriesDocuments < ActiveRecord::Migration
  def change
  	create_table :categories_documents do |f|
  		f.integer :category_id
  		f.integer :document_id
  	end

	add_index :categories_documents, :category_id
	add_index :categories_documents, :document_id
  end
end
