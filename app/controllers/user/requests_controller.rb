class User::RequestsController < UserController
  def show
    @reservations = reservations
  end

  def accept
    reservation.update_attribute :status, :accepted
  end

  def decline
    reservation.update_attribute :status, :declined
  end

  protected

  def reservations
    Reservation.requests current_user.id
  end

  def reservation
    Reservation.request params[:venue_id], params[:reservation], current_user.id
  end

end
