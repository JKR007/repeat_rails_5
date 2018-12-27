class PagesController < ApplicationController

  layout 'admin'

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
end
