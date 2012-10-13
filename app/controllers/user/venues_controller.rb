class User::VenuesController < UserController
  def show
    @venues = current_user.venues
  end

  def new
    @venue = current_user.venues.build
  end
end
