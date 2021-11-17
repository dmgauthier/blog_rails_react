class ApplicationController < ActionController::Base
    before_action :require_login

    skip_before_action :require_login, only: [:new, :create]

    private

    def not_authenticated
    flash[:warning] = 'You have to authenticate to access this page.'
    redirect_to log_in_path
    end

    def current_users
        User.current_users
    end  
    helper_method :current_users

end
