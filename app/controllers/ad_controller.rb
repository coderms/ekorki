class AdController < ActionController::Base
  include SessionHelper, ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Prevent entering pages for not logged users
  before_action :require_login, except: [:view, :user_message]
  before_action :populate_session_data

  def add
    @uzytkownik_id = current_user.id

    render 'add', layout: 'application'
  end

  def create
    user = Uzytkownik.find_by(id: params[:ogloszenie][:uzytkownik_id])
    ad = Ogloszenie.new
    title = params[:ogloszenie][:tytul]
    ad.tytul = title
    ad.opis = params[:ogloszenie][:opis]
    ad.telefon = params[:ogloszenie][:telefon]
    ad.imie = user.imie
    ad.nazwisko = user.nazwisko
    ad.email = user.email
    ad.kategoria = params[:ogloszenie][:kategoria]
    ad.photo = read_upload(params[:ogloszenie][:zdjecie].path) unless params[:ogloszenie][:zdjecie].nil?
    ad.uzytkownik_id = params[:ogloszenie][:uzytkownik_id]
    if ad.save
      ad_info = {
        email: user.email,
        name: user.imie,
        title: title,
        url: add_url(ad.id)
        }
      email_response = MyMailer.new_add_email(ad_info)
      puts email_response

      save_terms(ad, params[:ogloszenie])
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

  def user_message
    @ogloszenie = Ogloszenie.find(params[:message][:id])

    if !params[:message][:viewer_email].present?
      @errors ||= []
      @errors << {'message' => 'Nie wpisano adresu e-mail'}
    end

    if !message_set
      @errors ||= []
      @errors << {'message' => 'Nie wpisano treści wiadomości'}
    end

    if !days_set
      @errors ||= []
      @errors << {'message' => 'Nie wybrano dni dostępności'}
    end

    if !hours_set
      @errors ||= []
      @errors << {'message' => 'Nie wybrano godzin dostępności'}
    end

    if @errors.nil?
      message = {
        email: @ogloszenie.email,
        viewer_email: params[:message][:viewer_email],
        name: @name,
        message: params[:message][:message],
        url: add_url(params[:message][:id]),
        days: join_days(params[:message]),
        hours: join_hours(params[:message])
      }
      puts message
      email_response = MyMailer.user_message_email(message)
      puts email_response

      flash[:success] = 'Wiadomość została wysłana'
    end

    render 'view', layout: 'application'
  end

  private

  def message_set
    params[:message][:message].present?
  end

  def days_set
    (params[:message][:pon] ||
    params[:message][:wt] ||
    params[:message][:sr] ||
    params[:message][:czw] ||
    params[:message][:pt] ||
    params[:message][:sob] ||
    params[:message][:nie]).present?
  end

  def hours_set
    (params[:message][:rano] ||
    params[:message][:poludnie] ||
    params[:message][:wieczor]).present?
  end

  def join_days(days)
    result = ""
    result += "Poniedziałek, " if days[:pon]
    result += "Wtorek, " if days[:wt]
    result += "Środa, " if days[:sr]
    result += "Czwartek, " if days[:czw]
    result += "Piątek, " if days[:pt]
    result += "Sobota, " if days[:sob]
    result += "Niedziela, " if days[:nie]
    result
  end

  def join_hours(hours)
    result = ""
    result += "8:00 - 12:00, " if hours[:rano]
    result += "12:00 - 16:00, " if hours[:poludnie]
    result += "16:00 - 20:00, " if hours[:wieczor]
    result
  end

  def save_terms(ad, params)
      save_term(ad, 'Poniedziałek', params[:pon_time]) if params[:pon]
      save_term(ad, 'Wtorek', params[:wt_time]) if params[:wt]
      save_term(ad, 'Środa', params[:sr_time]) if params[:sr]
      save_term(ad, 'Czwartek', params[:czw_time]) if params[:czw]
      save_term(ad, 'Piątek', params[:pt_time]) if params[:pt]
      save_term(ad, 'Sobota', params[:sob_time]) if params[:sob]
      save_term(ad, 'Niedziela', params[:nie_time]) if params[:nie]
  end

  def save_term(ad, day, time)
    plan = PlanZajec.new
    plan.ogloszenie_id = ad.id
    plan.dzien_tyg = day
    if time.include?(" - ")
      plan.godzina_od = time.split(" - ")[0]
      plan.godzina_do = time.split(" - ")[1]
    end
    plan.save
  end
end
