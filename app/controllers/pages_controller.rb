class PagesController < ApplicationController

  layout 'admin'
  before_action :find_subjects, only: %i[new create edit update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]
  

  def index
    @pages = Page.newest_first
  end

  def show
    @page = Page.find params[:id]
  end

  def new
    @page = Page.new :name => 'Default Page'
  end

  def create
    @page = Page.new page_params
    if @page.save
      flash[:notice] = "Page - #{@page.name}, has been created successfully."
      redirect_to pages_path
    else
      # flash[:error] = "Error has been occured."
      render 'new'
    end
  end

  def edit
    @page = Page.find params[:id]
  end

  def update
    @page = Page.find params[:id]
    
    if @page.update_attributes page_params
      flash[:notice] = "Page - #{@page.name}, has been updated successfully."
      redirect_to page_path @page
    else
      # flash[:error] = "There has been some error while creation."
      render 'edit'
    end
  end

  def delete
    @page = Page.find params[:id]
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    flash[:notice] = "Page - #{@page.name}, has been deleted successfully."
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end

  def find_subjects
    @subjects = Subject.sorted_by_position
  end

  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end


end
