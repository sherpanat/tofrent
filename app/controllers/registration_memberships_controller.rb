class RegistrationMembershipsController < ApplicationController
  def create
    membership = RegistrationMembership.new(membership_params.merge(status: :pending))
    if membership.save
      flash[:notice] = "Demande d'adhésion a bien été envoyée. Vous recevrez un mail lorsque celle-ci sera traitée."
    else
      flash[:alert] = membership.errors.full_messages.join('. ')
    end
    redirect_to root_path
  end

  private

  def membership_params
    params.require(:registration_membership).permit(:email)
  end
end
