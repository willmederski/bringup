require 'rubygems'
require 'twilio-ruby'
#require 'sinatra'

#module TwilioCalls
# 	def send_test_text
# 		account_sid = ENV['TWILIO_ACCOUNT_SID']
# 		auth_token = ENV['TWILIO_TOKEN']
# 		client = Twilio::REST::Client.new account_sid, auth_token
# 		from = "+15128618455" # Your Twilio number
		 
# 		parents = {
# 		#"+15128261724" => "Lydia",
# 		"+18323725189" => "Pati",
# 		#"+12029069232" => "Will"
# 		}
# 		parents.each do |key, value|
# 		  client.account.sms.messages.create(
# 		    :from => from,
# 		    :to => key,
# 		    :body => "Hey #{value}, Please enter this course number 123457"
# 		  ) 
# 		  puts "Sent message to #{value}"
# 		end
# 	end
# #end

# send_test_text
 
def welcome
		account_sid = ENV['TWILIO_ACCOUNT_SID']
		auth_token = ENV['TWILIO_TOKEN']
		client = Twilio::REST::Client.new account_sid, auth_token
		from = "+15128618455" # Your Twilio number
		to = @reply.from
		 
		parents = {
		#"+15128261724" => "Lydia",
		"+18323725189" => "Pati",
		#"+12029069232" => "Will"
		}
		parents.each do |key, value|
		  client.account.sms.messages.create(
		    :from => from,
		    :to => key,
		    :body => "Welcome to BringUp!  Let's begin.  What is your first name?"
		  ) 
		  puts "Sent message to #{value}"
		end
	end

#puts account_sid

 
#get '/sms-quickstar' do
#  sender = params[:From]
#  friends = {
#    "+14153334444" => "Curious George",
#    "+14158157775" => "Boots",
#    "+14155551234" => "Virgil"
#  }
#  name = friends[sender] || "Mobile Monkey"
#  twiml = Twilio::TwiML::Response.new do |r|
#    r.Sms "Hello, #{name}. Thanks for the message."
#  end
#  twiml.text
#end

#--------------------------------------------
#Retrieveing Messages
#require 'rubygems'
#require 'twilio-ruby'

#@account_sid = ENV['TWILIO_ACCOUNT_SID']
#@auth_token = ENV['TWILIO_TOKEN']

# set up a client to talk to the Twilio REST API
#@client = Twilio::REST::Client.new(@account_sid, @auth_token)


#@account = @client.account
#@sms_message = @account.sms.messages.get('SMb537f13e815d3c24abb0433a48f83277')
#puts @sms_message

#------------------------------------------
#Incoming Phone Numbers

#require 'rubygems'
#require 'twilio-ruby'

#@account_sid = ENV['TWILIO_ACCOUNT_SID']
#@auth_token = ENV['TWILIO_TOKEN'

# set up a client to talk to the Twilio REST API
#@client = Twilio::REST::Client.new(@account_sid, @auth_token)


#@account = @client.account
#@incoming_phone_number = @account.incoming_phone_numbers.get('PN37b403aae4e1e765eefb33dcb4f8b779')
#puts @incoming_phone_number


#---------------------------------------------------

# require 'rubygems'
# require 'twilio-ruby'

# @account_sid = ENV['TWILIO_ACCOUNT_SID']
# @auth_token = ENV['TWILIO_TOKEN']

# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new(@account_sid, @auth_token)


# @account = @client.account
# @account.sms.messages.list({}).each do |message|
#   puts @message
# end