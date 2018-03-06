class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.datetime :birthday
      t.text :description
      t.boolean :gender
      t.string :orientation

      t.timestamps
    end
  end
end
