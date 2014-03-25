class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def login_required
   # redirect_to 'http://www.grumpycatnews.com'
    if !current_user
      respond_to do |format|
        format.html  {
          redirect_to '/auth/grumpy'
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= session[:user_id]
  end
end
