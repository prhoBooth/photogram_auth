class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :photos
         has_many :comments
         has_many :likes
         has_many :liked_photos, :through => :likes, :source => :photo

         validates :username, :presence => true
         validates :username, :uniqueness => true

        #  validates :email, :presence => true
        #  validates :password, :presence => true



#validates :duration, :numericality => { :less_than_or_equal_to => 2764800, :greater_than_or_equal_to => 0 }
#
# validates :title, :uniqueness => { :scope => [:year] }
#
# validates :title, :presence => true
#
# validates :year, :numericality => { :less_than_or_equal_to => 2050, :greater_than_or_equal_to => 1870 }
end
