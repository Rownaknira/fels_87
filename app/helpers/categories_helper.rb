module CategoriesHelper
  def load_category
    @category = Category.find params[:id]
  end
end