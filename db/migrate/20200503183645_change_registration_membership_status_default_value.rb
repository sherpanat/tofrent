class ChangeRegistrationMembershipStatusDefaultValue < ActiveRecord::Migration[6.0]
  def up
    remove_column :registration_memberships, :status
    add_column :registration_memberships, :status, :integer, default: 0, null: false
  end

  def down
    remove_column :registration_memberships, :status
    add_column :registration_memberships, :status, :string
  end
end
