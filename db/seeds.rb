# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'    

CSV.foreach("#{Rails.root}/public/seed_data/schools.csv", :headers => true) do |row|
  School.create!(row.to_hash)
end


#File.open("#{Rails.root}/public/seed_data/schools.csv") do |schools|
 # schools.read.each_line do |school|
   # "row names"=school_number,school_name, instruction_type, charter_type,school_street_address,school_city,school_state,	school_zip,school_site_address,school_site_city,school_site_state,school_site_zip,school_phone,school_fax,school_email_address,school_web_page_address,school_principal,grade_range,school_enrollment	_as_of_oct_2012,school_status,school_status_update,update_date
  #  school.chomp.split(",")
    
    # to create each record in the database
#     School.create!(
#     	:school_number => school_number, 
#     	:school_name => school_name, 
#     	:instruction_type =>  instruction_type,
#     	:charter_type => charter_type,
#     	:school_street_address => school_street_address,
#     	:school_city => school_city,
#     	:school_state => school_state,
#     	:school_site_address => school_site_address,
#     	:school_site_city => school_site_city,
#     	:school_site_state => school_site_state,
#     	:school_site_zip => school_site_zip,
#     	:school_phone => school_phone,
#     	:school_fax => school_fax,
#     	:school_email_address => school_email_address,
#     	:school_web_page_address => school_web_page_address,
#     	:school_principal => school_principal,
#     	:grade_range => grade_range,
#     	:school_enrollment_as_of_oct_2012 => school_enrollment_as_of_oct_2012,
#     	:school_status =>	school_status,
#     	:school_status_update	=> school_status_update,
#     	:update_date => update_date,
#     )             
#   end
# end

#"row names" = school_number	school_name	instruction_type	charter_type	school_street_address	school_city	school_state	
#school_zip	school_site_address	school_site_city	school_site_state	school_site_zip	school_phone	school_fax	
#school_email_address	school_web_page_address	school_principal	grade_range	school_enrollment_as_of_oct_2012	school_status	school_status_update	update_date
