class AddContentToRegistrationMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :registration_memberships, :content, :text
  end
end
