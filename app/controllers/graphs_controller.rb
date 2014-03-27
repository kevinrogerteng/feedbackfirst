class GraphsController < ApplicationController
  def index
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json }
    end
  end

  def create
    new_graph = Graph.create(graph_params)
    tags.params.each do |x|
      new_graph.tags << x
    end
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json => new_graph }
    end
  end

  private

  def graph_params
    params.require(:graph).permit(:name, :post_id)
  end

  def tags_params
    params.require(:graph).permit(:tags)
  end

end
