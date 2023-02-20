class ChangeNameToFirstNameOnUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.rename :name, :first_name
    end
  end
end
