class SamplesController < ApplicationController

  def index

  end

  def show
    @result = { :first_name => "jebie", :middle_name => "rivera", :last_name => "corsiga"}
    respond_to do |format|
      format.js
    end
  end
end
