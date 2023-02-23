class AddTimeZoneAssignableToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :time_zone, :string, default: "UTC"
    add_column :users, :assignable, :boolean, null: false, default: true
  end
end
