class AdminUserMailer < ApplicationMailer
  def new_registration
    @membership = params[:membership]
    mail(to: AdminUser::Email, subject: "Nouvelle demande d'adhésion")
  end
end
