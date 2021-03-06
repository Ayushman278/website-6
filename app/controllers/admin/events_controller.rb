class Admin::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /admin/events
  def index
    @events = Event.all
  end

  # GET /admin/events/1
  def show
    @rsvps_for_event = Rsvp.where(event: @event)
  end

  # GET /admin/events/new
  def new
    @event = Event.new
  end

  # GET /admin/events/1/edit
  def edit
  end

  # POST /admin/events
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/events/1
  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/events/1
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :location, :details)
    end
end
