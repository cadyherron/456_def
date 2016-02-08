class CreateEmployeeTeams < ActiveRecord::Migration
  def change
    create_table :employee_teams do |t|
      t.integer "employee_id", null: false
      t.integer "team_id", null: false
      t.string "employee_type", null: false

      t.timestamps null: false
    end
    add_index :employee_teams, [:employee_id, :team_id]
  end
end