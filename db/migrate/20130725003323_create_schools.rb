class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_number
      t.string :school_name
      t.string :instruction_type
      t.string :charter_type
      t.string :school_street_address
      t.string :school_city
      t.string :school_state
      t.string :school_zip
      t.string :school_site_street_address
      t.string :school_site_city
      t.string :school_site_state
      t.string :school_site_zip
      t.string :school_phone
      t.string :school_fax
      t.string :school_email_address
      t.string :school_web_page_address
      t.string :school_principal
      t.string :grade_range
      t.string :enrollment_as_of_oct_2012
      t.string :school_status
      t.string :school_status_date
      t.datetime :update_date

      t.timestamps
    end
  end
end