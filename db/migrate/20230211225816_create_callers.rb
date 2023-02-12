class CreateCallers < ActiveRecord::Migration[7.0]
  def change
    create_table :callers do |t|
      t.string :name
      t.string :phone
      t.text :notes

      t.timestamps
    end
  end
end
