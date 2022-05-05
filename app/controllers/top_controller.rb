class TopController < ApplicationController
  def index
    @columns = Column.where(user: current_user).order("created_at ASC")
  end
end
