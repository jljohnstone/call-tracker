class Note < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:content]
  belongs_to :customer
  belongs_to :user, optional: true
  validates :content, presence: true

  def customer_attributes=(attributes)
    customer = Customer.where(phone_number: attributes[:phone_number]).first || Customer.create(phone_number: attributes[:phone_number], name: attributes[:name])
    self.customer = customer
  end

  # after_create_commit -> {
  #   broadcast_prepend_to "notes",
  #   partial: "notes/note",
  #   locals: { note: self },
  #   target: "notes"
  # }
end
