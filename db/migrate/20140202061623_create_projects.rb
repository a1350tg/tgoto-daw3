class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :tempo
      t.references :user, index: true

      t.timestamps
    end
  end
end
