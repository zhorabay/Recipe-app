class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  mount_uploader :photo, PhotoUploader

  attribute :public, :boolean, default: false

  validates :name, presence: true
  validates :photo, presence: true
  validates :preparation_time, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :public, inclusion: { in: [true, false] }

  scope :public_recipes, -> { where(public: true).order(created_at: :desc) }
end
