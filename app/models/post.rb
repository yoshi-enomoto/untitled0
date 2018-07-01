class Post < ApplicationRecord
  has_many   :post_images
  # キャメルで命名しているので、『_』が入ってくる。

  validates :title,
            :content,
             presence: true
end
