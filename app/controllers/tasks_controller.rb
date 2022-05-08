class TasksController < ApplicationController
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

  private
  def task_params
    params.require(:task).permit(:task_title, :task_info, :column_id)
  end
end
