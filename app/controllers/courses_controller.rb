class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    require 'dates'
    @course = Course.find(params[:id])
    @message = Message.new
    @weekstart = MessageDates::execute

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    @course.teacher_id = current_teacher[:id]

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def generate_pdf
    pdf = Prawn::Document.new
    # pdf.text "Receive Free Daily Classroom Update", :align => :center, :size => 18
    # pdf.move_down 5
    # pdf.text "Bring Up", :align => :center, :size => 14
    # pdf.move_down 12
    # pdf.column_box([0, cursor], :columns => 2, :width => pdf.bounds.width) do
    #   text(<<-END
    #     Studies show that just asking your child how their school day was 
    #     and showing genuine interest in the learning that they are doing
    #     can have the same impact as hours of private tutoring!

    #     Sign up to receive classroom recaps from your student's teacher
    #     every evening via SMS text message.

    #     We will text you the necessary information to help you talk with
    #     your child about what they did in school every night.

    #     See www.bringuptogether.com for more information.

    #   END
    #   )
    # end
    pdf.text "Hello World"

    pdf_file_name = File.join(Rails.root, "public/pdfs", "course.pdf")

    pdf.render_file pdf_file_name

    send_file pdf_file_name
  end
end
