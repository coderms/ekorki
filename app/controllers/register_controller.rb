require 'digest'

class RegisterController < ActionController::Base
  include ApplicationHelper, SessionHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :populate_session_data
  
  def form
    render 'form', layout: 'application'
  end
  
  def new
    if params[:uzytkownik][:haslo] != params[:uzytkownik][:haslo_tmp]
      @errors = [{'message' => 'Hasła nie zgadzają się!'}]
      
      render 'form', layout: 'application'
      return
    end
    u = Uzytkownik.new
    imie = params[:uzytkownik][:ksywka]
    u.imie = imie
    u.nazwisko = params[:uzytkownik][:nazwisko]
    email = params[:uzytkownik][:email]
    u.email = email
    u.haslo = Digest::SHA256.hexdigest(params[:uzytkownik][:haslo])
    u.photo = read_upload(params[:uzytkownik][:zdjecie].path) unless params[:uzytkownik][:zdjecie].nil?
    u.created_at = Date.new
    if u.save
      user = {
        email: email, 
        name: imie
        }
      email_response = MyMailer.registered_email(user)
      puts email_response
    end
    render 'registered', layout: 'application'
  end
  
  def send_email
      #user = {email: 'maciejsowinski@o2.pl', name: @name}
      #result = MyMailer.registered_email(user)
      ad = {email: 'maciejsowinski@o2.pl', name: @name, title: 'Tytuł', url: "#{request.host_with_port}/view/#{15}"}
      result = MyMailer.new_add_email(ad)
      puts result
  end
end