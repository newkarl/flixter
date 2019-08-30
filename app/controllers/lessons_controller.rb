class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :student_enrolled

  # def new
  #   @course.user = course.new
  # end

  # def create
  #   @course.user = current_user.courses.sections(course_params)
  #   if @course.user.valid?
  #     redirect_to student_course_path(@course)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def show
  end

  private

  def student_enrolled
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course),alert:"must be enrolled first"
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
