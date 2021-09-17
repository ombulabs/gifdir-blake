require 'file_size_validator'
class Image < ApplicationRecord
  mount_uploader :uploaded_image, ImageUploader
  validates :uploaded_image, file_size: { maximum: 1.megabytes.to_i }
end
