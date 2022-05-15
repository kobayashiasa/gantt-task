class TopController < ApplicationController
  def index
    @columns = Column.where(user: current_user).rank(:row_order)
  end
end
