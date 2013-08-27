class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user       # this shit doesnt exist :(
			redirect_to user   # dont redirect to user object. Use user/(:id)
		else
			flash.now[:error] = 'Invalid email/password combo'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end	
end
