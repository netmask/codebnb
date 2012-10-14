class User::PeriodsController < UserController

  def new
    @venue = venue
    @periods = venue.periods
    @period = venue.periods.new
  end

  def show

  end

  def create
    if (@period = venue.periods.create params[:period])
      flash[:notice] = "Period Created!"
      redirect_to profile_venues_path()
    else
      flash[:erro] = "Errors #{@period.errors}"
      render :new
    end
  end

  def destroy
    @period = Period.find params[:id]
    @period.delete
    redirect_to profile_venues_path
  end

  protected

  def venue
    current_user.venues.find(params[:venue_id])
  end

end
