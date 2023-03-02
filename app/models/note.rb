class Note < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:content]
  belongs_to :customer
  belongs_to :user, optional: true
  validates :content, presence: true

  # after_create_commit -> {
  #   broadcast_prepend_to "notes",
  #   partial: "notes/note",
  #   locals: { note: self },
  #   target: "notes"
  # }
end
