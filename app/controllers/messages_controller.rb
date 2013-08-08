class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.find_all_by_course_id(params[:course_id])

    respond_to do |format|
      format.html # index.html.erb]
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    require 'dates'
    @message = Message.new(params[:message])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @message = @course.messages.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    require 'dates'
    @message1 = Message.new(:body => params["body1"],:course_id => params["course_id"],:send_date => params["date1"])
    @message2 = Message.new(:body => params["body2"],:course_id => params["course_id"],:send_date => params["date2"])
    @message3 = Message.new(:body => params["body3"],:course_id => params["course_id"],:send_date => params["date3"])
    @message4 = Message.new(:body => params["body4"],:course_id => params["course_id"],:send_date => params["date4"])
    @message5 = Message.new(:body => params["body5"],:course_id => params["course_id"],:send_date => params["date5"])
    @message1.save
    @message2.save
    @message3.save
    @message4.save
    @message5.save
    @message = @message1
    @weekstart = MessageDates::execute
    puts "params: #{params}"

    respond_to do |format|
        format.html { redirect_to course_messages_path, notice: 'Messages were successfully created.' }
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @course = Course.find(params[:course_id])
    @message = @course.messages.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to course_messages_path(@course), notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to course_messages_path }
      format.json { head :no_content }
    end
  end

  def send_message
    # @message = params
    # puts @message
    @parents = Parent.find_all_by_class_code(params[:course_id])
    puts @parents
    # put your own credentials here
    account_sid=ENV["TWILIO_ACCOUNT_SID"]
    auth_token=ENV["TWILIO_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # friends = {
    # "+14153334444" => "Curious George",
    # "+14155557775" => "Boots",
    # "+14155551234" => "Virgil"
    # }

    @parents.each do |parent|
      @client.account.sms.messages.create(
        :from => '+15128618455',
        :to => parent.phone_number,
        :body => "#{parent.first_nm}: #{params[:body]}"
      ) 
    end

    # @client.account.sms.messages.create(
    # :from => '+15128618455',
    # :to => '+15128261724',
    # :body => @message.body
    # )

    respond_to do |format|
        format.html { redirect_to course_path(current_teacher.courses.first.id), notice: 'Message was successfully sent.' }
    end

  end



 
end
