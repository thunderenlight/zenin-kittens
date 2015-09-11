class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :age
      t.integer :cuteness
      t.integer :softness
      t.integer :toughness
      t.text :description

      t.timestamps null: false
    end
  end
end
