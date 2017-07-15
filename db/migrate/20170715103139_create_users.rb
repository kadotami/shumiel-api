class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :password_digest, :null => false
      t.string :email, :null => false, :unique=>true 
    end
  end
end
