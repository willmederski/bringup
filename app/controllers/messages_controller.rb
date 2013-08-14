class MessagesController < ApplicationController
  before_filter :validate_user
  skip_before_filter :validate_user, :only => [:new, :send_message] 
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
    #create overwrites existing data for the same date and only creates new messages if the body of the submission contains viable content
    require 'dates'
    @message = @message1
    @course = Course.find(params["course_id"])
    @weekstart = MessageDates::execute

    week = [@message1,@message2,@message3,@message4,@message5]
    week.each_with_index do |day,i|
      puts @course.messages.find_by_send_date(params["date#{i+1}"].to_date)
      if  @course.messages.find_by_send_date(params["date#{i+1}"].to_date)
          @course.messages.find_by_send_date(params["date#{i+1}"].to_date).destroy
      end
      if params["body#{i+1}"].length > 1
        day = Message.new(:body => params["body#{i+1}"],:course_id => params["course_id"],:send_date => params["date#{i+1}"])
        day.save
      end
    end
    
    puts "params: #{params}"

    respond_to do |format|
        format.html { redirect_to @course, notice: 'Messages were successfully created.' }
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
    @teacher = Course.find_by_id(params[:course_id]).teacher
    @parents.each do |parent|
      @client.account.sms.messages.create(
        :from => '+15128618455',
        :to => parent.phone_number,
        :body => "#{@teacher.preferred_name}: #{params[:body]}"
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

 private

  
  def validate_user
    redirect_to teacher_root_path unless current_teacher and (current_teacher.id == Course.find(params[:course_id]).teacher_id)
  end


 
end
