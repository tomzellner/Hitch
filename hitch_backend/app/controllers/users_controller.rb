class UsersController < ApplicationController

	# def index
	# 	@users = User.all 
	# 	@user.each do |u|
	# 	render json: (u.id: u.email)

	# end

	def create
		user = User.new(user_params)
		if user.save
			render json: user
		# else
			# status 400
		end


	end

	def show
		user = User.find(params[:id])
		if user
			render json: {user: user}
		# else
		# 	status 400
		end

	end



	def update
	user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: { user: user }
	end

	

	# def edit

	# end



	def destroy
		User.find(params[:id]).destroy
	end

	private

	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :phonenumber, :password, :password_confirmation)
    end




end
