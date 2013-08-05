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



  # def receive
  #   @sms_state = session[:sms_state]
  #   if @sms_state.nil?
  #     @reply = Reply.new
  #     @reply.message_id = params["SmsSid"]
  #     @reply.account_sid=params["AccountSid"]
  #     @reply.from=params["From"]
  #     @reply.body=params["Body"]
  #     @reply.status=params["SmsStatus"]
  #     @reply.api_version=params["ApiVersion"]
  #     get_first_nm(@reply.from)
  #     @sms_state = 'welcome'
  #   elsif @sms_state == 'welcome'
  #     @reply.first_nm=params["Body"]
  #     get_last_nm(@reply.from)
  #     @sms_state = 'first_nm'   
  #   elsif @sms_state == 'first_nm'
  #     @reply.last_nm=params["Body"]
  #     @sms_state = 'complete'
  #   end


  def receive
    if session[:sms_state].nil?
      session[:sms_state]="welcome"
      @reply = Reply.new
      @reply.message_id = params["SmsSid"]
      @reply.account_sid=params["AccountSid"]
      @reply.from=params["From"]
      @reply.body=params["Body"]
      @reply.status=params["SmsStatus"]
      @reply.api_version=params["ApiVersion"]
      session[:sms_state]="first"
      get_first_nm(@reply.from)
    elsif session[:sms_state] == "welcome" 
     @reply.first_nm=params["Body"]
     get_last_nm(@reply.from)    
   elsif session[:sms_state] == "first"
     @sms_state = "complete"
     @reply.last_nm=params["Body"] 
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
    puts "Sent message to #{value}"
  end



end




