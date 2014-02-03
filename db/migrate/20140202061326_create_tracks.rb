class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :instrument
      t.text :score
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
