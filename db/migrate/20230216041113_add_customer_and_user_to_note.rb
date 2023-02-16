class AddCustomerAndUserToNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :customer, null: false, foreign_key: true
    add_reference :notes, :user#, null: false, foreign_key: true
  end
end
