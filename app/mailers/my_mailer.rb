class MyMailer < ActionMailer::Base
  default from: "kontakt@school.railsplayground.net"

  def user_message_email(message)
    @msg = message
    mail(to: @msg[:email], subject: 'Wiadomość z ogłoszenia').deliver
  end

  def new_add_email(ad)
    @ad = ad
    mail(to: @ad[:email], subject: 'Dodano nowe ogłoszenie').deliver
  end

  def registered_email(user)
    @user = user
    mail(to: @user[:email], subject: 'Rejestracja użytkownika w KorkiZMuzy.pl').deliver
  end
end
