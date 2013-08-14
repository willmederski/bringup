class RepliesController < ApplicationController
  require "time"
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_teacher!

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

  def receive
    # 1. set a @parent based on phone number and/or course number if they exist
    # 2/ you then move on to the next state on the parent
    @reply = Reply.new
    @reply.message_id = params["SmsSid"]
    @reply.account_sid=params["AccountSid"]
    @reply.from=params["From"]
    @reply.body=params["Body"]
    #@reply.status=params["SmsStatus"]
    @reply.api_version=params["ApiVersion"]
    if Parent.find_by_phone_number(@reply.from).nil? && Course.find_by_id(@reply.body.to_i).present?
      @parent=Parent.new
      @parent.phone_number=@reply.from
      @parent.class_code=@reply.body
      @parent.added_course_number_and_phone_number 
      @parent.save!
      get_first_nm(@reply.from)
    elsif Parent.find_all_by_phone_number(@reply.from).last.state == 'course_num_and_phone' && Course.find_by_id(@reply.body.to_i).present?
      @parent=Parent.new
      @parent.phone_number=@reply.from
      @parent.class_code=@reply.body
      @parent.added_course_number_and_phone_number 
      @parent.save!
      get_first_nm(@reply.from)
    elsif Parent.find_all_by_phone_number(@reply.from).last.state == "first_nm"
      @parent=Parent.find_all_by_phone_number(@reply.from).last
      @parent.first_nm = @reply.body
      @parent.added_first_name
      get_last_nm(@reply.from)
    elsif Parent.find_all_by_phone_number(@reply.from).last.state == "last_nm"
      @parent=Parent.find_all_by_phone_number(@reply.from).last
      @parent.last_nm = @reply.body   
      @parent.added_last_name
      get_child_nm(@reply.from)
    elsif Parent.find_all_by_phone_number(@reply.from).last.state == "child_nm"
      @parent=Parent.find_all_by_phone_number(@reply.from).last
      @parent.child_nm = @reply.body   
      @parent.added_child_name
      get_relationship(@reply.from)
    elsif Parent.find_all_by_phone_number(@reply.from).last.state == "relationship"
      @parent=Parent.find_all_by_phone_number(@reply.from).last
      @parent.relationship = @reply.body   
      @parent.added_relationship
      get_delivery_time(@reply.from)
    elsif Parent.find_all_by_phone_number(@reply.from).last.state == "delivery_time"
      @parent=Parent.find_all_by_phone_number(@reply.from).last
      @parent.delivery_time = @reply.body   
      @parent.added_delivery_time
      send_sign_off(@reply.from)
    #THIS FUNCTIONALITY IS PENDING TWILIO USES SHORT CODES STOP AND START
    #THIS IS A PROBLEM IF PARENT SUBSCRIBES FOR SEVERAL COURSES AND CHILDREN
    #PSilva 8.9.2013  
    # elsif Parent.find_by_phone_number(@reply.from).present? &&
    #     @reply.body="STOP"
    #     @parent.state="stop"
    #     send_unsubscribe_msg(@reply.from)
    end


    respond_to do |format|
      if @reply.save
        #format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        format.xml{ render xml: @reply, status: :created, location: @reply }
      else
        #format.html { render action: "new" }
        format.xml { render xml: @reply.errors, status: :unprocessable_entity }
      end
  end
end



  def get_first_nm(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "Welcome to BringUp!  Let's begin.  What is your first name?"
    ) 
  end

  def get_last_nm(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "What is your last name?"
    ) 
  end

def get_last_nm(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "What is your last name?"
    ) 
  end

  def get_child_nm(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "What is the name of the child?"
    ) 
  end

  def get_relationship(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "What is your relationship to the child?"
    ) 
  end

    def get_delivery_time(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "What time would you like your message delivered?  Enter 4, 5 or 6."
    ) 
  end

   def send_sign_off(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "Thank you.  We have all the information we need."
    ) 
  end

#THIS FUNCTIONALITY IS PENDING TWILIO USES SHORT CODES STOP AND START
#THIS WILL ONLY BE A PROBLEM IS A PARENT IS RECEIVING MESSAGES FOR SEVERAL
#COURSE AND CHILDREN -- NEEDS TO BE EVALUATED PSilva 8.9.2013
  def send_unsubscribe_msg(sendto)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+15128618455" # Your Twilio number
    to = sendto

    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "Thank you.  You have been unsubscribed from bringup."
    ) 
  end
end




