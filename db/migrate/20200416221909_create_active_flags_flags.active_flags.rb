# This migration comes from active_flags (originally 20190304151043)
class CreateActiveFlagsFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :active_flags_flags, id: :uuid do |t|
      t.string :key
      t.string :value
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
  end
end
