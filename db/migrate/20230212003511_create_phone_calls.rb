class CreatePhoneCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_calls do |t|
      t.text :notes
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
