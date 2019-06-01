class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
      t.references :user, foreign_key: true
      t.datetime :start_time
      t.string :name
      t.decimal :total_amount, precision: 6, scale: 2
      t.decimal :intake, precision: 6, scale: 2
      t.decimal :calorie, precision: 6, scale: 2
      t.decimal :protein, precision: 6, scale: 2
      t.decimal :fat, precision: 6, scale: 2
      t.decimal :carb, precision: 6, scale: 2
      t.decimal :sugar, precision: 6, scale: 2

      t.timestamps
    end
  end
end
