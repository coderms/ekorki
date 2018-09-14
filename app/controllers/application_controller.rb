require 'digest'

class ApplicationController < ActionController::Base
  include ApplicationHelper, SessionHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_login, only: [:logout]
  before_action :populate_session_data

  def index
    @ads = Ogloszenie.all
  end
  
  def login
  end
  
  def new_session
    user = Uzytkownik.find_by(email: params[:uzytkownik][:email])
    if user.nil?
      @errors = [{'message' => 'Nie ma takiego użytownika!'}]
      
      render 'login'
      return
    end
    if user.haslo == Digest::SHA256.hexdigest(params[:uzytkownik][:haslo])
      session[:user_id] = user.id
      @user = user
      cookies[:login] = { :value => user.id, :expires => Time.now + Rails.application.config.login_time }
      logger.debug("User logged in with id: #{session[:user_id]}")
    else
      @errors = [{'message' => 'Nieprawidłowe hasło!'}]
      
      render 'login'
      return
    end
    
    redirect_to root_url
  end
  
  def logout
    @user = session[:user_id] = nil
    cookies.delete :login
    redirect_to root_url
  end
end
