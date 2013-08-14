class SchoolsController < ApplicationController
	skip_before_filter :authenticate_teacher!, :only => :suggest
  def index
  end

  def index
    @schools = School.order(:school_name)

    respond_to do |format|
      format.html # index.html.erb]
      format.json { render json: @schools.map(&:school_name) }
    end
  end

  def update
  end

  def show
  end

  def create
  end

  def suggest
  	query = "#{params[:term]}%"
	  sql = "school_name LIKE ?" 

	  @schools = School.where([sql, *query])
	  render :json => @schools.map {|s| s.school_name}
  end
end
