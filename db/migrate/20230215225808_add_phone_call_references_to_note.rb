class AddPhoneCallReferencesToNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :phone_call, null: false, foreign_key: true
  end
end
