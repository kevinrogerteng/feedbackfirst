class GraphsController < ApplicationController
  def index
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json }
    end
  end

  def create
    new_graph = Graph.create(graph_params)
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json => new_graph }
    end
  end

  def update
    graph = Graph.find(params[:id])
    graph.update_attributes(graph_params)
    binding.pry
    if params[:tags] != nil
      params[:tags].each do |tag|
        graph.tags << Tag.find(tag['id'])
        Tag.find(tag['id']).tickets.each do |ticket|
          Post.find(graph.post_id).tickets << ticket
        end
      end
    end

    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json => graph}
    end
  end

  def show
    graph = Graph.find(params[:id])
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render :json => graph.as_json(:include => [:tags => {:only => :name}])}
    end
  end

  def delete
  end

  private

  def graph_params
    params.require(:graph).permit(:name, :post_id)
  end

end
