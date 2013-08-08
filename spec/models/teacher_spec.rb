require 'spec_helper'

describe Teacher
  context 'some context' do
    let(:teacher) do
      Teacher.new email:                 'teacher@school.com',
                  full_name:             'Tom Teacher',
                  phone:                 '555-1212',
                  preferred_name:        'Tom',
                  principal_name:        'Principal Person',
                  school:                'MakerSquare',
                  password:              'password',
                  password_confirmation: 'password'
    end
  end
end

