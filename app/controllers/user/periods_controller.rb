class User::PeriodsController < UserController

  def index
    @periods = venue.periods
  end

  def create
    venue.periods.build params[:period]
  end

  def destroy
    venue.periods.find params[:period_id]
  end


  protected

  def venue
    current_user.venues.find(params[:venue_id])
  end

end
