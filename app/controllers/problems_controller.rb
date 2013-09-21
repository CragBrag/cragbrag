class ProblemsController < ApplicationController
  before_action :set_gym
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = @gym.problems.build problem_params

    if @problem.save
      redirect_to [@gym, @problem], notice: 'Problem was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @problem.update(problem_params)
      redirect_to [@gym, @problem], notice: 'Problem was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to gym_problems_url(@gym) }
      format.json { head :no_content }
    end
  end

  private
    def set_gym
      @gym = Gym.find params[:gym_id]
    end

    def set_route
      @problem = Problem.find params[:id]
    end

    def route_params
      params.require(:problem).permit(:gym_id, :active, :name, :grade, :photo, :photo_url)
    end
end
