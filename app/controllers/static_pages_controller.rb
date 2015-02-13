class StaticPagesController < ApplicationController

  #before_filter :is_admin?

  def impressum
  	# yield
  end
  
  def home
  	    @percent_finished = "27"
  end
  
  def status
  	    #yield
  end
end
