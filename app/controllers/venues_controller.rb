class VenuesController < ApplicationController

  def show
    @venue = Venue.where(id: params[:id]).includes(:periods)
  end

end
