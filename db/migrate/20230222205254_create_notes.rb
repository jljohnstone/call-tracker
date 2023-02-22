class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.boolean :completed, null: false, default: false
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :user#, null: false, foreign_key: true

      t.timestamps
    end
  end
end
