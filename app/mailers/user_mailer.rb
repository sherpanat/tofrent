class UserMailer < ApplicationMailer
  def membership_accepted
    @email = params[:email]
    mail(to: @email, subject: "Demande d'adhésion acceptée !")
  end

  def membership_refused
    @email = params[:email]
    mail(to: @email, subject: "Demande d'adhésion refusée")
  end
end
