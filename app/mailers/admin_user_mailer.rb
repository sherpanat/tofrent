class AdminUserMailer < ApplicationMailer
  def new_registration
    @email = params[:email]
    mail(to: AdminUser::Email, subject: "Nouvelle demande d'adhésion")
  end
end
