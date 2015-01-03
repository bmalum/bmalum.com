class StaticPagesController < ApplicationController
	#before_filter :logged_in?


  def impressum
  	# yield
  end
  
  def home
  	    @percent_finished = "16"
  end
  
  def status
  	    #yield
  end
end
