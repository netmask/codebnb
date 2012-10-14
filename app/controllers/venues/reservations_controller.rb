class Venues::ReservationsController < ApplicationController

  def new
    @period = venue.periods.reservations.build
  end

  def create
    if @reservation = period.reservations.create(status: 'requested', user: current_user) #todo THIS IS A SCOPE!
      flash[:succes] = 'Reservation applyed, '
    else
      flash[:error] = 'You cant apply for this venue #{@reservation.errors}'
    end
  end

  def destroy
  end

  def show
    @reservations  = period.reservations
  end


  protected

  def venue
    current_user.venues.find(params[:venue_id])
  end

  def period
    venue.periods.find(params[:id])
  end

end
