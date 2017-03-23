class CreatePlaydates < ActiveRecord::Migration[5.0]
  def change
    create_table :playdates do |t|
      t.string :location
      t.datetime :date
      t.string :description
      t.string :title
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
