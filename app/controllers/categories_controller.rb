class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order(:name)
  end
end
