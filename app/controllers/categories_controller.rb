class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_global_data, except: [:destroy]

    def new
        @category = Category.new
    end

    def show 
        @category = @categories.find(params[:id])
        @tasks = @category.tasks.order(:created_at)
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
