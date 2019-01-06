class DemoController < ApplicationController
  layout 'application'
  before_action :confirm_logged_in
  def index
    # render 'index'
    @id = params[:id]
    @page = params['page']
  end

  def hello
    @array = [1,2,3,4,5]
    # render 'hello'
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def linkedIn
    redirect_to 'https://linkedin.com'
  end

  def escape_output
    
  end
end
