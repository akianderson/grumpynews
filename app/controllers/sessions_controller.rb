class SessionsController < ApplicationController
	def create
    session[:omniauth] = env['omniauth.auth']

    redirect_to feeds_path
  end

  # Omniauth failure callback
  def failure
    flash[:notice] = params[:message]

  end

  # logout - Clear our rack session BUT essentially redirect to the provider
  # to clean up the Devise session from there too !
  def destroy
    session[:omniauth] = nil

    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{CUSTOM_PROVIDER_URL}/sign_out"
  end
end