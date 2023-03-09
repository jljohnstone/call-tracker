class Note < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:content]
  belongs_to :customer#, inverse_of: :notes
  accepts_nested_attributes_for :customer
  validates_associated :customer
  belongs_to :assigned_to_user, optional: true, class_name: "User"
  validates :content, presence: true

  def customer_attributes=(attributes)
    customer = Customer.where(phone_number: attributes[:phone_number]).first

    if !customer
      customer = Customer.create(phone_number: attributes[:phone_number], name: attributes[:name])
    elsif customer.name != attributes[:name]
      customer.update!(name: attributes[:name])
    end

    self.customer = customer
  end

  # after_create_commit -> {
  #   broadcast_prepend_to "notes",
  #   partial: "notes/note",
  #   locals: { note: self },
  #   target: "notes"
  # }
end
