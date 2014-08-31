class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :page_content
      t.string :alias

      t.timestamps
    end
  end
end
