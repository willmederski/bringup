class ParentsController < ApplicationController
  before_filter :validate_user
  skip_before_filter :validate_user, :only => [:index, :new, :create] 
  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.find_all_by_class_code(params[:course_id])
    @parents = Parent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parents }
    end
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @parent = Parent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parent }
    end
  end

  # GET /parents/new
  # GET /parents/new.json
  def new
    @parent = Parent.new
    @course_id = params
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parent }
    end
  end

  # GET /parents/1/edit
  def edit
    @parent = Parent.find(params[:id])
    @course_id = params
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(params[:parent])
    @course_id = params[:parent][:class_code]
    respond_to do |format|
      if @parent.save
        format.html { redirect_to course_path(@course_id), notice: 'Parent was successfully created.' }
        format.json { render json: @parent, status: :created, location: @parent }
      else
        format.html { redirect_to new_parent_path(:add_param => @course_id), notice: 'Phone number must be formatted as specified' }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parents/1
  # PUT /parents/1.json
  def update
    @parent = Parent.find(params[:id])
    @course_id = params[:parent][:class_code]
    respond_to do |format|
      if @parent.update_attributes(params[:parent])
        format.html { redirect_to course_path(@course_id), notice: 'Parent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_parent_path(@parent,:add_param => @course_id), notice: 'Phone number must be formatted as specified' }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent = Parent.find(params[:id])
    @course_id = params[:add_param]
    @parent.destroy

    respond_to do |format|
      format.html { redirect_to course_path(@course_id) }
      format.json { head :no_content }
    end
  end

  private

  def validate_user
    redirect_to teacher_root_path unless current_teacher and (current_teacher.id == Course.find(Parent.find(params[:id]).class_code).teacher_id)
  end

end
