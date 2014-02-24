class CategoriesController < ApplicationController
  
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.where(permalink: params[:id]).first
  end
  
end
