class Image < ApplicationRecord
  belongs_to :post, optional: true
  # 『optional: true』はbelongs_toの外部キーのnilを許可するというものです。

  mount_uploader :content, PostImageUploader
end
