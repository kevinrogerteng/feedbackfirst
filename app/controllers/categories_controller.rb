class CategoriesController < ApplicationController
  def index
    categories = Categories.includes[:subcategories]
    respond_to do |f|
        f.html  {render :layout => false }
        f.json {render :json => categories.as_json(:include=> [:subcategories])}
    end
  end
end
