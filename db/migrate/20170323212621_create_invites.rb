class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :playdate, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
