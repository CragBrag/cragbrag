class RoutesController < ApplicationController
  before_action :set_gym
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = @gym.routes.build route_params

    if @route.save
      redirect_to [@gym, @route], notice: 'Route was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @route.update(route_params)
      redirect_to [@gym, @route], notice: 'Route was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to gym_routes_url(@gym) }
      format.json { head :no_content }
    end
  end

  private
    def set_gym
      @gym = Gym.find params[:gym_id]
    end

    def set_route
      @route = Route.find params[:id]
    end

    def route_params
      params.require(:route).permit(:gym_id, :active, :name, :grade, :photo, :photo_url)
    end
end
