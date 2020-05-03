ActiveAdmin.register User do
  permit_params :email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmed_at, :confirmation_sent_at, :locked_at, :nickname

  index do
    column :email
    column :nickname
    column :sign_in_count
    column :last_sign_in_at
    column :last_sign_in_ip
    column :confirmed_at
    column :confirmation_sent_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :nickname
      row :sign_in_count
      row :last_sign_in_at
      row :last_sign_in_ip
      row :confirmed_at
      row :confirmation_sent_at
    end
  end

  form do |f|
    f.input :email
    f.input :nickname
    f.actions
  end
end
