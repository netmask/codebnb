class UserController < ApplicationController

  before_filter :authenticated

  def authenticated
    redirect_to "/auth/github?request_path=#{request.path}" unless current_user
  end

end
