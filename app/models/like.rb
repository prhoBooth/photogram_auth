class Like < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user

  validates :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => [:photo_id]}
  validates :photo_id, :presence => true

  # validates :title, :uniqueness => { :scope => [:year] }
end
