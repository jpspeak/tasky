class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        home_path
    end

    def set_global_data
        @categories = current_user.categories.order(:created_at)
        @todays_tasks = current_user.tasks.where(schedule_date: DateTime.current.to_date).includes(:category)
    end

end
