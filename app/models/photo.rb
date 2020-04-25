class Photo < ApplicationRecord
  belongs_to :post
  mount_uploader :image, ImageUploader


  validate :image_must_be_present

  private
  def image_must_be_present
    if !image
      errors.add(:image, "Image must be Present")
    end  
  end  
end  
