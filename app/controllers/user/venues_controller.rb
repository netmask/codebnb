class User::VenuesController < UserController

  def index
    @venues = current_user.venues
  end

  def edit
    @venue = current_user.venues.find(params[:id])
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
      render :index
    end
  end

  def update
    @venue = current_user.venues.find(params[:id])
    if @venue.update_attributes(params[:venue])
      flash[:notice] = 'Venue Updated'
      redirect_to action: :index
    else
      flash[:error] = "Errros #{@veneu.errrors}"
      render :index
    end
  end

  def destroy
    @venue = current_user.venues.find(params[:id])
    @venue.delete
    redirect_to action: :index
  end

end
