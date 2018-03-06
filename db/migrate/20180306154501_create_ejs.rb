class CreateEjs < ActiveRecord::Migration[5.1]
  def change
    create_table :ejs do |t|
      t.string :title
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end
