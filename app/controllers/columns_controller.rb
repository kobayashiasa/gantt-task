class ColumnsController < ApplicationController
  before_action :set_column, only: [:edit, :update, :destroy]
  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @column.update_attributes(column_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @column.destroy
    redirect_to root_path
  end

  def sort
    @column = Column.find(params[:column_id])
    @column.update(column_params)
    render nothing: true
  end

  private
  def column_params
    params.require(:column).permit(:column_title, :row_order_position).merge(user: current_user)
  end

  def set_column
    @column = Column.find(params[:id])
  end
end
