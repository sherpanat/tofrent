class CreateTorrents < ActiveRecord::Migration[6.0]
  def change
    create_table :torrents, id: :uuid do |t|
      t.uuid :owner_id, references: [:users, :id], null: false
      t.uuid :friend_id, references: [:users, :id]
      t.string :source
      t.string :visibility
      t.string :title
      t.text :description

      t.timestamps
    end

    add_index :torrents, :title
  end
end
