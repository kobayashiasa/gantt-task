class ColumnsController < ApplicationController
  before_action :set_column, only: [:edit, :update]
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

  private
  def column_params
    params.require(:column).permit(:column_title).merge(user: current_user)
  end

  def set_column
    @column = Column.find(params[:id])
  end
end
