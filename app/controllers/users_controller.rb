class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)  # params[:user] 대신 사용한다.
  	if @user.save
  		sign_in @user
  		flash[:success] = "축하합니다!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end


  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
