class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password]) #레일즈의 관용적 표현이다.
			sign_in user
			redirect_to user
		else
			flash.now[:error] = "이메일/비밀번호가 일치하지 않습니다."
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
