class AddPriorityToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :priority, :boolean, null: false, default: false
  end
end
