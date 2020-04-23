class Photo < ApplicationRecord
  belongs_to :post
  mount_uploader :image, ImageUploader

  validates_presence_of :photo, message: "Photo can't be blank"
end  
