class TasksController < ApplicationController
  before_action :require_user_logged_in
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
      else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end
  
  private

  def task_params
    params.require(:task).permit(:content)
  end
  
end
