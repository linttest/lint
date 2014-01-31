class CreateErrorLines < ActiveRecord::Migration
  def change
    create_table :error_lines do |t|
      t.integer :commit_id, null: false
      t.text :description
      t.integer :line_number

      t.timestamps, null: false
    end

    add_index :error_lines, :commit_id
  end
end
