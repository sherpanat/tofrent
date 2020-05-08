ActiveAdmin.register RegistrationMembership do
  permit_params :email, :status

  form do |f|
    f.input :email
    f.actions
  end

  action_item :accept_membership, only: :show, if: proc{ resource.pending? || resource.refused? } do
    link_to 'Accepter', accept_membership_fortress_of_solitude_registration_membership_path(resource), method: :put
  end

  action_item :refuse_membership, only: :show, if: proc{ resource.pending? || resource.accepted? } do
    link_to 'Refuser', refuse_membership_fortress_of_solitude_registration_membership_path(resource), method: :put
  end

  member_action :accept_membership, method: :put do
    resource.update!(status: :accepted)
    redirect_to fortress_of_solitude_registration_membership_path(resource)
    UserMailer.with(email: resource.email).membership_accepted.deliver_now
  end

  member_action :refuse_membership, method: :put do
    resource.update!(status: :refused)
    redirect_to fortress_of_solitude_registration_membership_path(resource)
    UserMailer.with(email: resource.email).membership_refused.deliver_now
  end
end
