class Note < ApplicationRecord
  belongs_to :customer
  belongs_to :user, optional: true
  accepts_nested_attributes_for :customer
  validates_associated :customer
  validates :content, presence: true
  # default_scope { order(created_at: :asc) }
  scope :history, -> { order(created_at: :desc) }
  scope :latest, -> { history.first }
  scope :all_but_latest, -> { history.offset(1) }
end
