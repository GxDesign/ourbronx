class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, if: :devise_controller?
    
    def home
		render "homepage/index" 
	end

    def community 
        @eventbrite = Eventbrite.new
        @events = @eventbrite.create_event_stream
        render "community/index.html.erb"
    end

    def arts 
        render "arts/index.html.erb"
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar, :first_name, :last_name, :linkedIn, :bio, :email, :password, :current_password, :gender, :date_of_birth, :avatar) }
    end

end
