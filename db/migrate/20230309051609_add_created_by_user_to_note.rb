class AddCreatedByUserToNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :created_by_user
  end
end
