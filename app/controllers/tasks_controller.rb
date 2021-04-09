class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :store_location, only: [:destroy]
    def new
        @task =  Task.new
        @category = current_user.categories.find(params[:category_id])  
    end

    def create
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.create(task_params)

        if @task.save
            redirect_to category_path(params[:category_id])
        else
            render "new", collection: @article
        end
    end

    def edit 
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    end

    def update
        @category = current_user.categories.find(params[:category_id])
        @task =  @category.tasks.find(params[:id])
        task = @task.update(task_params)
        if task
            redirect_to category_path(params[:category_id])
        else
            render "edit"
        end
    end

    def destroy
        category = current_user.categories.find(params[:category_id])
        task = category.tasks.find(params[:id])
        task.destroy
        # redirect_to category_path(params[:category_id])
        # redirect_to stored_location || home_path
        redirect_back fallback_location: home_path
    end
    private
    def task_params
      params.require(:task).permit(:name, :category_id, :schedule_date)
    end

end
