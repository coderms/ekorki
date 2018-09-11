module SessionHelper
  def current_user
    @user ||= session[:user_id]
    Uzytkownik.find_by(id: session[:user_id])
  end
  
  def populate_session_data
    if !session[:user_id].nil?
      u = Uzytkownik.find_by(id: session[:user_id])
      @user_name ||= "#{u.imie} #{u.nazwisko}"
    end
  end
end