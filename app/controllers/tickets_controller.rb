class TicketsController < ApplicationController
  respond_to :json
  def index
    @tickets = Ticket.all
    respond_with @tickets
  end
end
