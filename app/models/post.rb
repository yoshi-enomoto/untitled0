class Post < ApplicationRecord
  has_many   :images, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :images, reject_if: :reject_images

  validates :title,
            :content,
             presence: true

  def reject_images(attributed)
    attributed['content'].blank?
  end
end
