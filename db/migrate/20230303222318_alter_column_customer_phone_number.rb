class AlterColumnCustomerPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :customers, :phone_number, unique: true
  end
end
