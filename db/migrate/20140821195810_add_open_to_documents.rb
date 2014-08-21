class AddOpenToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :open, :boolean, :default => false
  end
end
