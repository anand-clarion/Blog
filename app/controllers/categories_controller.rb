class CategoriesController < ApplicationController

  # This action show all categories
  def index
    @categories = Category.all
  end

  # This action created a new category instance 
  def new
    @category = Category.new
  end

  # This actions added a new record in categories table
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url
    else 
      render "new"
    end
  end

  # This action edit a category inforamation
  def edit
    @category = Category.find(params[:id])
  end

  # This action update a category information
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category successfully updated"
      redirect_to categories_url
    else
      render 'edit'
    end
  end

  # This actoin delete a record from categories table
  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:notice] = "Category successfully deleted"
      redirect_to categories_url
    else
      flash[:notice] = "Some problem in deletion"
    end
  end

  # This action permit all accessible attributes
  def category_params
    params.require(:category).permit(:name, :is_active)
  end

end
