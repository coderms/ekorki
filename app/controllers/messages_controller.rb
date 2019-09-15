class AdController < ActionController::Base
  include SessionHelper, ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Prevent entering pages for not logged users
  before_action :require_login
  before_action :populate_session_data

  def all
    @wiadomosci = Wiadomosci.find_by(id: params[:uzytkownik_id])

    render partial: 'messages'
  end
end
