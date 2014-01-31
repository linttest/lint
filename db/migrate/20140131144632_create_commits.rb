class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha, null: false
      t.string :repository_name
      t.integer :user_id, null: false

      t.timestamps, null: false
    end

    add_index :commits, :sha, unique: true
    add_index :commits, :user_id
  end
end
