class HomeController < ApplicationController
  def index
  end

  def near
    @venues = Venue.near([params[:lat], params[:lon]], params[:radius])
  end

end
