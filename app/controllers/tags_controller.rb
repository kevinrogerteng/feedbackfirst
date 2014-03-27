class TagsController < ApplicationController
  def index
    tags = Tag.includes(:tickets)
    respond_to do |f|
        f.html  {render :layout => false }
        f.json {render :json => tags.as_json(:include=> [:tickets])}
    end
  end
end
