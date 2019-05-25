class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
      t.references :user_id
      t.datetime :start_time
      t.string :name
      t.integer :total_amount
      t.integer :intake
      t.integer :calorie
      t.integer :protein
      t.integer :fat
      t.integer :carb
      t.integer :sugar

      t.timestamps
    end
  end
end
