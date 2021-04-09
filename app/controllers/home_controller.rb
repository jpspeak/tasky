class HomeController < ApplicationController
  before_action :authenticate_user!
  # before_acton :store_location, only: [:index]

  def index
    @categories = current_user.categories.order(:created_at)
    # @todays_tasks = Task.where(schedule_date: DateTime.current.to_date).includes(:category)
    @todays_tasks = current_user.tasks.where(schedule_date: DateTime.current.to_date).includes(:category)
    # render plain: @todays_tasks.inspect
  end

  
  
end
