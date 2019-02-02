module SessionHelper
  def require_login
    if current_user.nil? 
      @errors = [{'message' => 'Musisz być zalogowany!'}]
      logger.debug("Musisz być zalogowany aby dostąpić zaszczytu oglądania tej sekcji")
      redirect_to login_url
    end
  end
  
  def current_user
    if !session[:user_id].nil?
      @user ||= session[:user_id]
      return Uzytkownik.find_by(id: session[:user_id])
    end
    if !cookies[:login].nil?
      session[:user_id] = cookies[:login]
      @user ||= cookies[:login]
      return Uzytkownik.find_by(id: session[:user_id])
    end
    nil
  end
  
  def populate_session_data
    if !current_user.nil?
      u = Uzytkownik.find_by(id: current_user.id)
      @user_name ||= "#{u.imie} #{u.nazwisko}"
      @name = u.imie
    end
  end
end