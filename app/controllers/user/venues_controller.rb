class User::VenuesController < UserController

  def index
    @venues = current_user.venues
  end

  def show
    @venue = current.user.venues.find(params[:id])
  end

  def new
    @venue = current_user.venues.build
  end

  def create
    if (@venue = current_user.venues.create(params[:venue]))
      flash[:notice] = "Venue Created!"
      redirect_to action: :index
    else
      flash[:error] = "Errors #{@venue.errors}"
      render :new
    end
  end

end
