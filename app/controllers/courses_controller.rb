class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  require 'prawn'
  include CoursesHelper
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
    @parents = Parent.find_all_by_class_code(params[:id])
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
    @course =Course.find(params[:id])
    course_id = params[:id]
    pdf = Prawn::Document.new
    #pdf.stroke_bounds
    image_url = 
    
    #colors for text
    orange = "FF9200"
    teal   = "009092"
    black  = "000000"

    pdf.text "Receive Free Daily Classroom Updates!", :align => :left, :size => 28
    
    pdf.bounding_box([0, 675], :width => 225, :height => 100) do
      #pdf.stroke_bounds
      pdf.fill_color "FF9200"
      pdf.text "bringup", :align => :center, :size => 20
        end

    pdf.bounding_box([325, 675], :width => 200, :height => 30) do
      pdf.fill_color black
      pdf.text "Sign Up for FREE!", :align => :center, :size => 20
    end

    pdf.image "#{Rails.root}/app/assets/images/Cell-Sketch-Green.png", :position => :right
      
    pdf.bounding_box([360, 550], :width =>200, :height =>30) do
      pdf.text "Text:", :align =>:left, :size => 18
    end

     pdf.bounding_box([360, 530], :width =>200, :height =>30) do
      pdf.fill_color "FF9200"
      pdf.text course_id, :align =>:left, :size => 18
    end

    pdf.bounding_box([360, 500], :width =>200, :height =>30) do
      pdf.fill_color black
      pdf.text "To:", :align =>:left, :size => 18
    end

    pdf.bounding_box([360, 480], :width =>200, :height =>30) do
      pdf.fill_color "FF9200"
      pdf.text "+15124444444", :align =>:left, :size => 18
    end


    pdf.bounding_box([0, 645], :width => 225, :height => 400) do
      #pdf.stroke_bounds
      pdf.fill_color teal
      pdf.text "Studies show that just asking your child how their school day was and showing genuine interest in the learning they are doing can have the same impact as hours of private tutoring!

      Sign up to receive classroom recaps from your student's teacher every evening via SMS text message.

      We will text you the necessary information to help you talk with your child about what they did in school every night.",
       :align => :justify, :size => 11, :font_color => teal
        end

    pdf.bounding_box([0, 445], :width => 225, :height => 200) do
      pdf.fill_color orange
      pdf.text "See www.bringuptogether.com for more information", :align => :left
      end    
 
    pdf_file_name = File.join(Rails.root, "public/pdfs", "#{@course.name}.pdf")

    pdf.render_file pdf_file_name

    send_file pdf_file_name
  end
end
