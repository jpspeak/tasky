class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.order(:created_at)
    @todays_tasks = current_user.tasks.where(schedule_date: DateTime.current.to_date).includes(:category)
  end

  
  
end
