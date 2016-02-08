class CreateProgressReports < ActiveRecord::Migration
  def change
    create_table :progress_reports do |t|
      t.text :body , null: false
      t.integer "author_id", null: false
      t.integer "team_id", null: false

      t.timestamps null: false
    end
  end
end
