class User::ProfilesController < UserController

  def show
    @user = current_user
  end

  def update
    if current_user.update_attributes params[:user]
      flash[:notice] = 'Success!'
    else
      flash[:error] = 'Something was wrong, #{current_user.errors}'
    end
  end

end
