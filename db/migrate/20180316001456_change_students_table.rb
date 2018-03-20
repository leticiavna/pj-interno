class ChangeStudentsTable < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :gender, :string
  end
end
