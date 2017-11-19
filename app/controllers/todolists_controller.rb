class TodolistsController < ApplicationController
  before_action :set_list, :only =>[:show, :edit, :update, :destroy,:is_public]
  def index
    @todolists = Todolist.order(expired_date: :desc)
  end
  
  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      redirect_to todolists_url 
    else
      render "new"
    end
  end

 
  def is_public
    @todolist.update(check_box: !(@todolist.check_box))
  end

  def update
    
    if @todolist.update_attributes(todolist_params)
      redirect_to todolist_path(@todolist)
    else  
      render "edit"
    end
    
  end

  def destroy
    @todolist.destroy
    redirect_to todolists_url
  end
 

  #私有方法
  private
  def set_list
     @todolist = Todolist.find(params[:id])    
  end

  def todolist_params
    params.require(:todolist).permit(:name, :expired_date, :note)
  end
end
