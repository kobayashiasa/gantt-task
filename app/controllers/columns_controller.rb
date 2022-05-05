class ColumnsController < ApplicationController
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

  private
  def column_params
    params.require(:column).permit(:column_title).merge(user: current_user)
  end
end
