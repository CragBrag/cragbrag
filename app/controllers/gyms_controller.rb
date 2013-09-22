class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    @gyms = Gym.all
  end

  def show
    @top_boulderer = User.all
    @top_top_roper = User.all
    @event_stream = Climb.includes(:problem, :user).where('problems.gym_id' => @gym).limit(10)
  end

  def new
    @gym = Gym.new
  end

  def edit
  end

  def create
    @gym = Gym.new(gym_params)

    respond_to do |format|
      if @gym.save
        format.html { redirect_to @gym, notice: 'Gym was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gym }
      else
        format.html { render action: 'new' }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gym.update(gym_params)
        format.html { redirect_to @gym, notice: 'Gym was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gym.destroy
    respond_to do |format|
      format.html { redirect_to gyms_url }
      format.json { head :no_content }
    end
  end

  private
    def set_gym
      @gym = Gym.find params[:id]
    end

    def gym_params
      params.require(:gym).permit(:name)
    end
end
