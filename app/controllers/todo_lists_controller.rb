class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def show
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

    @todo_list.save
    redirect_to home_path
      
  end

  def update
    @todo_list.update(todo_list_params)
    
  end

  def destroy
    @todo_list = TodoList.find(params[:id])

    @todo_list.destroy
    
    redirect_to home_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
