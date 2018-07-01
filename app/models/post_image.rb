class PostImage < ApplicationRecord
  belongs_to :post

  mount_uploader :content, PostImagesUploader
end
