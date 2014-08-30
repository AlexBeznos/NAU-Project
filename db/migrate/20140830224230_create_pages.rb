class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :content
      t.string :alias

      t.timestamps
    end
  end
end
