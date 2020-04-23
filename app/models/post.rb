class Post < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  # accepts_nested_attributes_for :photos

  validates_presence_of :content
end
