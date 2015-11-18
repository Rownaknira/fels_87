class Admin::WordsController < ApplicationController
  before_action :load_word, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :new, :create, :destroy]

  def index
    @words = Word.all.paginate page: params[:page], per_page: 20
  end

  def new
    @word = Word.new
    4.times{@word.answers.build}
  end

  def create
    @word = Word.new word_params
    if @word.save
      redirect_to admin_words_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      redirect_to admin_words_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to admin_words_url
  end

  private
  def word_params
    params.require(:word).permit :id, :category_id, :content, answers_attributes: [ :id, :content, :correct, :word_id]
  end

  def load_word
    @word = Word.find params[:id]
  end
end
