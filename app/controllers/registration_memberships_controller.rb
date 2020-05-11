class RegistrationMembershipsController < ApplicationController
  def create
    membership = RegistrationMembership.new(membership_params)
    if membership.save
      flash[:notice] = "Demande d'adhésion a bien été envoyée. Vous recevrez un mail lorsque celle-ci sera traitée."
      AdminUserMailer.with(membership: membership).new_registration.deliver_now
      redirect_to root_path
    else
      flash[:alert] = membership.errors.full_messages.join('. ')
      @registration_membership = membership
      render 'pages/home'
    end
  end

  private

  def membership_params
    params.require(:registration_membership).permit(:email)
  end
end
