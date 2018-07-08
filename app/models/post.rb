class Post < ApplicationRecord
  has_many   :images, dependent: :destroy
  belongs_to :user
  has_many   :tags, through: :post_tags
  has_many   :post_tags, dependent: :destroy

  accepts_nested_attributes_for :images, reject_if: :reject_images

  validates :title,
            :content,
             presence: true

  def reject_images(attributed)
    attributed['content'].blank?
  end
end
