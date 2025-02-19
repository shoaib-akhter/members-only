class Post < ApplicationRecord
  belongs_to :user

  # Validation: Ensure content isn't empty
  validates :content, presence: true
end
