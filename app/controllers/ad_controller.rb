class AdController < ActionController::Base
  include SessionHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Prevent entering pages for not logged users
  before_action :require_login
  before_action :populate_session_data
  
  def add
    render 'add', layout: 'application'
  end
  
  def create
    ad = Ogloszenie.new
    title = params[:ogloszenie][:tytul]
    ad.tytul = title
    ad.opis = params[:ogloszenie][:opis]
    ad.telefon = params[:ogloszenie][:telefon]
    imie = params[:ogloszenie][:imie]
    ad.imie = imie
    ad.nazwisko = params[:ogloszenie][:nazwisko]
    email = params[:ogloszenie][:email]
    ad.email = email
    ad.kategoria = params[:ogloszenie][:kategoria]
    ad.photo = read_upload(params[:ogloszenie][:zdjecie].path) unless params[:ogloszenie][:zdjecie].nil?
    if ad.save
      ad = {
        email: email, 
        name: imie, 
        title: title, 
        url: add_url(ad.id)
        }
      email_response = MyMailer.new_add_email(ad)
      puts email_response
    end
    
    flash[:success] = 'Ogłoszenie zostało stworzone a na twojego maila dostałeś wiadomość'
    
    redirect_to root_url
  end
  
  def edit
    @ogloszenie = Ogloszenie.find(params[:id])
    
    render 'edit', layout: 'application'
  end
  
  def update
    ad = Ogloszenie.find(params[:id])
    ad.tytul = params[:ogloszenie][:tytul]
    ad.opis = params[:ogloszenie][:opis]
    ad.telefon = params[:ogloszenie][:telefon]
    ad.imie = params[:ogloszenie][:imie]
    ad.nazwisko = params[:ogloszenie][:nazwisko]
    ad.email = params[:ogloszenie][:email]
    ad.kategoria = params[:ogloszenie][:kategoria]
    ad.photo = read_upload(params[:ogloszenie][:zdjecie].path) unless params[:ogloszenie][:zdjecie].nil?
    ad.save
    
    flash[:success] = 'Ogłoszenie zostało zaktualizowane'
    
    redirect_to root_url
  end
  
  def delete
    ad = Ogloszenie.find(params[:id])
    ad.destroy
    
    flash[:success] = 'Ogłoszenie zostało usunięte'
    
    redirect_to root_url
  end
  
  def view
    @ogloszenie = Ogloszenie.find(params[:id])
    
    render 'view', layout: 'application'
  end
  
  private
  
  def add_url(id)
    "#{request.host_with_port}/view/#{id}"
  end
end
