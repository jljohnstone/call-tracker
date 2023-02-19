class AddDoneToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :done, :boolean, null: false, default: false
  end
end
