class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.integer :age
      t.integer :gender
      t.string :email, null: false
      t.string :password, null: false
      t.string :token
      t.string :phone_number
      t.date :birth_date
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
