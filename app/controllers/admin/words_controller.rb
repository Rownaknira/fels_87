class Admin::WordsController < ApplicationController
  include WordsHelper
  before_action :load_word, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :new, :create, :destroy]

  def index
    @words = Word.all
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
    params.require(:word).permit :category_id, :content, answers_attributes: [ :content, :correct]
  end
end