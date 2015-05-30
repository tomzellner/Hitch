class ApplicationController < ActionController::API
	include AbstractController::Translation

	before_action :allow_cross_domain
  before_action :authenticate_user_from_token!

  respond_to :json

  # User Authentication
  # Authenticates the user with OAuth2 Resource Owner Password Credentials Grant
  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    if auth_token
      authenticate_with_auth_token auth_token
    else
      authentication_error
    end
  end

	private

	 def allow_cross_domain
	      headers['Access-Control-Allow-Origin'] = '*'
	      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
	      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
	  end

	  def authenticate_with_auth_token auth_token 
		  unless auth_token.include?(':')
		    authentication_error
		    return
		  end

		  user_id = auth_token.split(':').first #USER and TOKEN are a string split by ':'
		  user = User.where(id: user_id).first

		  if user && Devise.secure_compare(user.access_token, auth_token)
		    # User can access
		    sign_in user, store: false
		  else
		    authentication_error
	  	end
	  end

	  # Authentication Failure
	  # Renders a 401 error
	  def authentication_error
	    # User's token is either invalid or not in the right format
	    render json: {error: t('unauthorized')}, status: 401  # Authentication timeout
	  end
	
end
