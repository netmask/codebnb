class Venues::ReservationsController < ApplicationController
  respond_to :html, :json

  def index
    @periods = venue.periods
  end

  def create
    respond_with(@reservation = period.reservations.create(status: :applyed, user: current_user))
  end

  def destroy
  end

  def show
    @periods = venue.periods
  end


  protected

  def venue
    current_user.venues.find(params[:venue_id])
  end

  def period
    venue.periods.find(params[:id])
  end

end
