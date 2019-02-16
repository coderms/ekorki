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
    ad.tytul = params[:ogloszenie][:tytul]
    ad.opis = params[:ogloszenie][:opis]
    ad.telefon = params[:ogloszenie][:telefon]
    ad.imie = params[:ogloszenie][:imie]
    ad.nazwisko = params[:ogloszenie][:nazwisko]
    ad.email = params[:ogloszenie][:email]
    ad.kategoria = params[:ogloszenie][:kategoria]
    ad.photo = read_upload(params[:ogloszenie][:zdjecie].path) unless params[:ogloszenie][:zdjecie].nil?
    ad.save
    
    render 'created', layout: 'application'
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
    
    render 'updated', layout: 'application'
  end
  
  def delete
    ad = Ogloszenie.find(params[:id])
    ad.destroy
    
    render 'deleted', layout: 'application'
  end
  
  def view
    @ogloszenie = Ogloszenie.find(params[:id])
    
    render 'view', layout: 'application'
  end
end
