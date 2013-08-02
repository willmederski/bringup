class RepliesController < ApplicationController
  require "time"
  skip_before_filter :verify_authenticity_token, :only => [:receive]
  skip_before_filter :authenticate_teacher!, :only => [:receive]

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply }
    end
  end 

#Example

# def receive
  
#   #check for session variable and redirect if necessary
#   @sms_state = session[:sms_state]
#   if @sms_state = 'confirmation'
#     redirect_to :action => 'confirm'
#     return
#   end
#   body = Params[:Body]
#   user = User.find_by_phone_num(phone_num)
#     if user.favorites.find_by_name(body)
#     @sms_state = 'confirmation'
#     session[:sms_state] = @sms_state
#     render :action => "response.xml.builder", :layout => false
#     else
#     @sms_state = 'new_order'
#     session[:sms_state] = @sms_state
#     render: action => "error.xml.builder", :layout => false
#     end
#    end 



def receive
  @reply = Reply.new
  @reply.message_id = params["SmsSid"]
  @reply.account_sid=params["AccountSid"]
  @reply.from=params["From"]
  @reply.body=params["Body"]
  @reply.status=params["SmsStatus"]
  @reply.api_version=params["ApiVersion"]



  respond_to do |format|
    if @reply.save
      #format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
      format.xml{ render xml: @reply, status: :created, location: @reply }
    else
      #format.html { render action: "new" }
      format.xml { render xml: @reply.errors, status: :unprocessable_entity }
    end
  end

  @sms_state = session[:sms_state]
  if @sms_state.nil?
     @sms_state = 'welcome'
     get_first_nm
   elsif @sms_state == 'welcome'
    @reply.first_nm=params["Body"]
    @sms_state = 'first_nm'
    get_last_nm
  elsif @sms_state == 'first_nm'
    @reply.last_nm=params["Body"]
    @sms_state = 'complete'
  end

end

def get_first_nm
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_TOKEN']
  client = Twilio::REST::Client.new account_sid, auth_token
  from = "+15128618455" # Your Twilio number
  to = @reply.from
     

  client.account.sms.messages.create(
    :from => from,
    :to => to,
    :body => "Welcome to BringUp!  Let's begin.  What is your first name?"
      ) 
      puts "Sent message to #{value}"
    end

  def get_last_nm
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_TOKEN']
  client = Twilio::REST::Client.new account_sid, auth_token
  from = "+15128618455" # Your Twilio number
  to = @reply.from
     

      client.account.sms.messages.create(
        :from => from,
        :to => to,
        :body => "What is your last name?"
      ) 
      puts "Sent message to #{value}"
    end

#   if session[:sms_state] = 'welcome'
#     @parent.first_nm = params["Body"]
#     session[:sms_state]= 'first_nm'
#     get_last_nm
# end

# def last_nm
#   if session[:sms_state] = 'first_nm'
#     @parent.last_nm = params["Body"]
#     session[:sms_state]= 'last_nm'
#     get_child_nm
# end

# def child_nm
#   if session[:sms_state] = 'last_nm'
#     @parent.child_nm= params["Body"]
#     session[:sms_state]='child_nm'
#     get_relationship
#   end

# def relationship
#   if session[:sms_state] = 'child_nm'
#     @parent.relationship = params["Body"]
#     session[:sms_state]='relationship'
#     get_delivery_time

# end

# def delivery_time
#   if session[:sms_state] = 'relationship'
#     @parent.relationship = params["Body"]
#     session[:sms_state]='delivery_time'
#    end
   
# def delivery_time
#   if session[:sms_state] = 'delivery_time'
#     @parent.delivery_time = params["Body"]
#     session[:sms_state]='delivery_time'
#     sign_off
#     set parent.status field to complete
#    end   

end




