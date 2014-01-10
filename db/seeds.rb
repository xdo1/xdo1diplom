# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(role_name: "Администратор", role_number: 2)
Role.create(role_name: "Оператор отрезков", role_number: 1)
Role.create(role_name: "Оператор справочной информации", role_number: 0)
year = StudyYear.create(years: "#{1.year.ago.year}/#{Time.now.year}")
StudyYear.create(years: "#{2.year.ago.year}/#{1.year.ago.year}")
StudyYear.create(years: "#{3.year.ago.year}/#{2.year.ago.year}")
User.create!(username: "admin", password: "11111", password_confirmation: "11111", current_role: 1, first_name: "test", second_name: "test", last_name: "test", roles: Role.all, current_year: year.id)
puts "ROLES AND USERS SUCCESSFULLY CREATED"

EducationForm.create!(name: 'Очная')
EducationForm.create!(name: 'Заочная')
EducationForm.create!(name: 'Очно-заочная')
puts "EDUCATION FORMS SUCCESSFULLY CREATED"

bases_file=File.new('files/base_utf.txt')
while name=bases_file.gets
  name=name.split('|').last.to_s
  if name.size > 2
    unless name.start_with?('(') or name.start_with?('--') or name.start_with?('     ')
      EducationBase.create!(name: name.chomp!)
      puts "CREATED EDUCATION BASE #{name} "
    end
  end
end

qualifications_file=File.new('files/kvalif_utf.txt')
while name=qualifications_file.gets
  name=name.split('|').last.to_s
  if name.size > 2
    unless name.start_with?('(') or name.start_with?('--') or name.start_with?('     ')
      Qualification.create!(name: name.chomp!)
      puts "CREATED QUALIFICATION #{name} "
    end
  end
end

specialities_file=File.new('files/spec_utf.txt')
while spec=specialities_file.gets
  unless spec.start_with?('--') or spec.start_with?(' idspec')
    direction_numer=spec.split('|')[1].to_s.strip
    direction_name=spec.split('|')[2].to_s.strip
    speciality_numer=spec.split('|')[3].to_s.strip
    speciality_name=spec.split('|')[4].to_s.strip
    qualification=spec.split('|')[5].to_s.strip
    if qualification.size > 2 and direction_numer.size > 2 and direction_name.size > 2 and qualification.size > 2
      Speciality.create!(direction_numer: direction_numer, direction_name: direction_name, speciality_numer: speciality_numer, speciality_name: speciality_name, qualification: qualification)
      puts "CREATED SPECIALITY #{direction_name} "
    end
  end
end

subjects_file=File.new('files/subject_utf.txt')
while name=subjects_file.gets
  full_name=name.split('|').first.to_s
  short_name=name.split('|').last.to_s
  if full_name.size > 2 and short_name.size > 1
    unless name.start_with?('(') or name.start_with?('--') or name.start_with?('     ')
      Subject.create!(name: full_name, short_name: short_name.chomp!)
      puts "CREATED SUBJECT #{name} "
    end
  end
end

plans_file=File.new('files/plans_utf.txt')
while plan=plans_file.gets
  unless plan.start_with?('(') or plan.start_with?('--') or plan.start_with?('     ') or plan.start_with?(' idtp') or plan.split('|')[3].to_s.strip.start_with?('Бухгалтерский учет, анализ и аудит в коммерческих организациях')
    tp_id=plan.split('|')[0].to_i
    plan_name=plan.split('|')[3].to_s.strip
    Plan.create!(plan_name: plan_name, tp_id: tp_id)
    puts "CREATED PLAN #{plan_name} "
  end
end
