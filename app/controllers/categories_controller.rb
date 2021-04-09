class CategoriesController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @category = Category.new
    end

    def show 
        @categories = current_user.categories
        @category = @categories.find(params[:id])
        @tasks = @category.tasks.order(:created_at)
        @todays_tasks = current_user.tasks.where(schedule_date: DateTime.current.to_date).includes(:category)
    end

    def create
        @category = current_user.categories.create(category_param)
        if @category.save
            redirect_to category_path(@category.id)
        else 
            render :new
        end
    end

    def edit 
        @category = current_user.categories.find(params[:id])
    end

    def update
        @category = current_user.categories.find(params[:id])
        category =  @category.update(category_param)
        if category
            redirect_to  category_path(@category.id)
        else
            render :edit
        end
    end

    def destroy
        category = current_user.categories.find(params[:id])
        category.destroy

        redirect_to home_path
    end
    private
    def category_param
      params.require(:category).permit(:name)
    end

end
