class ApplicationController < ActionController::Base
        
  before_action :allow_cross_origin_requests , if: proc { Rails.env.development? }
  before_action :check_login_status

  def check_login_status
    unless current_user.nil?
      @current_user = current_user.decorate
    end
  end

  # Logs in user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # When making a cross origin request, the HTTP client will automatically 
  # make an additional request called a "preflight check" before the actual request
  def preflight
    render nothing: true
  end

protected
  def current_user
    User.find_by(id: session[:user_id])
  end

private
  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end
end
