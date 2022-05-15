class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def new
    @task = Task.new
    @column = Column.find(params[:column_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    @columns = Column.where(user: current_user)
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:task_title, :task_info, :column_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
