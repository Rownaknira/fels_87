class ResultsController < ApplicationController
  before_action :logged_in_user

  def index
    @lessons = current_user.lessons.order('lessons.created_at DESC')
  end
end
