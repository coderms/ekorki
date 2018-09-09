class AdController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def add
    render 'add'
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
    
    render 'created'
  end
  
  def edit
    @ogloszenie = Ogloszenie.find(params[:id])
    
    render 'edit'
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
    
    render 'updated'
  end
  
  def delete
    ad = Ogloszenie.find(params[:id])
    ad.destroy
    
    render 'deleted'
  end
end
