class Reply < ActiveRecord::Base
  attr_accessible :account_sid, :api_version, :body, :date_created, :date_updated, :direction, :from, :message_id, :price, :price_unit, :uri
end
