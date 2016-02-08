# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.destroy_all
Team.destroy_all
EmployeeTeam.destroy_all
ProgressReport.destroy_all


def create_employee
  e = Employee.new
  e[:first_name] = Faker::Name.first_name
  e[:last_name] = Faker::Name.last_name
  e[:email] = Faker::Internet.email
  e.save

  3.times do
    generate_employee_teams(e[:id])
  end

end


def create_team
  t = Team.new
  t[:name] = Faker::Team.name
  t.save

end


def generate_employee_teams(employee_id)
  (rand(10) + 1).times do
    et = EmployeeTeam.new
    et[:employee_id] = employee_id
    et[:team_id] = Team.pluck(:id).sample
    et[:employee_type] = ["member", "owner"].sample
    et.save
  end
end


def generate_progress_reports
  pr = ProgressReport.new
  pr[:body] = Faker::Hipster.paragraph
  pr[:author_id] = Employee.pluck(:id).sample
  pr[:team_id] = Team.pluck(:id).sample
  pr.save
end 



5.times do
  puts "creating teams..."
  create_team  
  puts "creating employees..."
  create_employee
  puts "creating progress reports..."
  generate_progress_reports
end




