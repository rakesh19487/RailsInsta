class Post < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  # accepts_nested_attributes_for :photos

  validates_presence_of :content, message: "Content can't be blank"

  def is_belongs_to? (user)
    Post.find_by(user_id: user.id, id: id)
  end  
end
