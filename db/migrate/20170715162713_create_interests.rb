class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.float :value, :null => false

      t.timestamps
    end
  end
end
