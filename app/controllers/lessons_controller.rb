class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @course.user = course.new
  end

  def create
    @course.user = current_user.courses.sections(course_params)
    if @course.user.valid?
      redirect_to student_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def require_authorized_for_current_user
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
