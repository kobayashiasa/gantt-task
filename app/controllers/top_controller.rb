class TopController < ApplicationController
  def index
    @columns = Column.rank(:row_order)
    @tasks = Task.rank(:row_order)
  end
end
