class Admin::CategoriesController < ApplicationController
  include CategoriesHelper
  before_action :load_category, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :new, :create, :destroy]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end    
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
