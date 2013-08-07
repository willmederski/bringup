class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_teacher!
    def index
      render :layout => 'publicapp'
    end
end
