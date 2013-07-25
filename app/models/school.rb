class School < ActiveRecord::Base
  attr_accessible :address, :charter_type, :enrollment_as_of_oct_2012, :grade_range, :instruction_type, :school_, 
  :school_city, :school_email, :school_fax, :school_name, :school_number, :school_phone, 
  :school_principal, :school_site_city, :school_site_state, :school_site_street_address, :school_site_zip, :school_state, :school_status, :school_status_date, :school_street_address, :school_web_page_address, :school_zip, :update_date
end
