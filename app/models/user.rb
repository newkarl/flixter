class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course


  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end


end
