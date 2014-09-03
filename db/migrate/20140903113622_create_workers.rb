class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :fio
      t.string :email
      t.string :category_id

      t.timestamps
    end
    add_index :workers, :category_id
  end
end
