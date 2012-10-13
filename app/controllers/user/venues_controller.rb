class User::VenuesController < UserController

  def show
    @venues = current_user.venues
  end

  def new
    @venue = current_user.venues.build
  end

  def create
    if (@venue = current_user.venues.create(params[:venue]))
      flash[:notice] = "Venue Created!"
      redirect_to action: :show
    else
      flash[:error] = "Errors #{@venue.errors}"
      render :new
    end
  end

end
