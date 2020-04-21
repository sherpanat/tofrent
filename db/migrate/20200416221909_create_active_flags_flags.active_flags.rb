# This migration comes from active_flags (originally 20190304151043)
class CreateActiveFlagsFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :active_flags_flags, id: :uuid do |t|
      t.string :key, null: false
      t.string :value, null: false
      t.uuid :subject_id, null: false
      t.string :subject_type, null: false

      t.timestamps
    end
  end
end
