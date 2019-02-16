class MyMailer < ActionMailer::Base
  default from: "kontakt@somapro.pl"
  
  def new_add_email(user, message)
    @user = user
    @message = message
    mail(to: @user[:email], subject: 'Kontakt z ogłoszenia').deliver
  end
  
  def new_add_email(user)
    @user = user
    mail(to: @user[:email], subject: 'Dodano nowe ogłoszenie').deliver
  end
  
  def registered_email(user)
    @user = user
    mail(to: @user[:email], subject: 'Rejestracja użytkownika w KorkiZMuzy.pl').deliver
    return 'OK'
  end
end