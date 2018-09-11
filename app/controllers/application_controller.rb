require 'digest/md5'

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
    if user.haslo == Digest::MD5.hexdigest(params[:uzytkownik][:haslo])
      session[:user_id] = user.id
      @_current_user = user
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
    redirect_to root_url
  end
  
  private
 
  def require_login
    if current_user.nil?
      @errors = [{'message' => 'Musisz być zalogowany!'}]
      logger.debug("Musisz być zalogowany aby dostąpić zaszczytu oglądania tej sekcji")
      redirect_to login_url
    end
  end
end
