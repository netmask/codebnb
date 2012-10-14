class VenuesController < ApplicationController

  def show
    @venue = Venue.where(id: params[:id]).includes(:periods)
  end

  def near
    respond_to do |format|
      format.js { render json: Venue.near([params[:lat], params[:long]], params[:rad]) }
    end
  end

end
