class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction

  # GET /tasks
  # GET /tasks.json
  def index
    if params["sort"] == 'name'
      @tasks = Task.all.order('title ASC')
    elsif params[:sort] == 'created_at'
      @tasks = Task.all.order(:created_at)
    else
      @tasks = Task.all.order('title ASC')
    end
  end

  def index_sort_by_title
    Task.order('title ASC')
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html {redirect_to @task, notice: 'Task was successfully created.'}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :new}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end


# PATCH/PUT /tasks/1
# PATCH/PUT /tasks/1.json
def update
  respond_to do |format|
    if @task.update(task_params)
      format.html {redirect_to @task, notice: 'Task was successfully updated.'}
      format.json {render :show, status: :ok, location: @task}
    else
      format.html {render :edit}
      format.json {render json: @task.errors, status: :unprocessable_entity}
    end
  end
end

# DELETE /tasks/1
# DELETE /tasks/1.json
def destroy
  @task.destroy
  respond_to do |format|
    format.html {redirect_to tasks_url, notice: 'Task was successfully destroyed.'}
    format.json {head :no_content}
  end
end

# POST change_to_done/:id'
# changes task's status from todo to done
def change_to_done
  @task = Task.find(params[:id])
  @task.done = true
  @task.save
  redirect_to root_path
end

# POST change_to_todo/:id
# changes task's status from done to todo
def change_to_todo
  @task = Task.find(params[:id])
  @task.done = false
  @task.save
  redirect_to root_path
end

def delete_multiple
  #@tasks = Task.find(params[:cb_tasks])
  #@tasks.destroy
  Task.where(id: params[:cb_tasks]).destroy_all
  respond_to do |format|
    format.html {redirect_to tasks_url, notice: 'Tasks was successfully destroyed.'}
    format.json {head :no_content}
  end
end

def check_all
  tags_id = params[:cb_tasks]
  if tags_id == '0'
    tags_id == '1'
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_task
  @task = Task.find(params[:id])
end

# def task_params
#   params.require(:task).permit(:title, :description, :priority, :due, :done, :user_id)
# end
# Never trust parameters from the scary internet, only allow the white list through.
def task_params
  params.require(:task).permit(:title, :description, :priority, :due, :done, :user_id)
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
end

end
