class LessonsController < ApplicationController
  before_action :logged_in_user

  def index
    @lessons = current_user.lessons
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def create
    category = Category.find params[:lesson][:category_id]
    @lesson = category.lessons.create lesson_param
    redirect_to @lesson
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_param
      redirect_to categories_path
    else
      flash[:danger] = t "flashs.invalid"
      redirect_to root_url
    end
  end

  private
  def lesson_param
    params.require(:lesson).permit(:user_id, :category_id,
                  results_attributes: [:answer_id, :id])
  end
end
