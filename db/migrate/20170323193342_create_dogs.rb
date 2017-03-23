class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :breed
      t.boolean :vaccinated
      t.boolean :neutered
      t.integer :weight
      t.string :image
      t.string :temperament
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
