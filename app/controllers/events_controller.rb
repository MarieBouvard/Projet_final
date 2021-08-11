class EventsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create edit update destroy]

    def new
      @event = Event.new
    end

    def index
      @events = Event.all
    end

    def create
    end

    def show
    end

    def params_event
    end
  
end
