class API::V1::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(user_params)
    if @user.save
      render :json => {:state => {:code => 0}, :data => @user }
    else
      @user = null
      render :json => {:state => {:code => 1, :messages => @user.errors.full_messages}, :data => @user}
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end