class StaticPagesController < ApplicationController
<<<<<<< HEAD
	#before_filter :logged_in?

=======

  before_filter :logged_in?
>>>>>>> refs/heads/Authentification

  def impressum
  	# yield
  end
  
  def home
  	    @percent_finished = "19"
  end
  
  def status
  	    #yield
  end
end
