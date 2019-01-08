class PublicController < ApplicationController
  layout 'public'

  before_action :setup_navigation

  def index
    # intro text
  end

  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    if @page.nil?
      redirect_to root_path
    else
      # show page and its sections
    end
  end

  private

  def setup_navigation
    @subjects = Subject.visible.newest_first
  end
end
