class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(2).order(:id)
  end 
  
  
end
