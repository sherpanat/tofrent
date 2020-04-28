class CreateRegistrationApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :registration_applications, id: :uuid do |t|
      t.string :email
      t.string :status
      
      t.timestamps
    end

    add_index :registration_applications, :email
  end
end
