class User::RequestsController < UserController
  def show
    @reservations = reservations
  end

  def accept
    reservation = reservations.last
    reservation.update_attribute :status, :accepted
  end

  def decline
    reservation = reservations.last
    reservation.update_attribute :status, :declined
  end

  protected

  def reservations
    Reservation.requests_for params[:venue_id], current_user.id
  end
end
