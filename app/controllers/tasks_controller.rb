class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(user_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(user_params)
    redirect_to task_path(@task)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path
  end

  private
  #methode qui definit les variables pouvant etre modifie par le user => plus secure
  def user_params
    params.require(:task).permit(:name , :status)
  end

end
