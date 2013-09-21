class ClimbsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

  def index
    @climbs = current_user.climbs
  end

  def show
  end

  def new
    @climb = current_user.climbs.build
  end

  def edit
  end

  def create
    @climb = current_user.climbs.build climb_params

    respond_to do |format|
      if @climb.save
        format.html { 
          @climb.publish_to_stream
          redirect_to @climb, notice: 'Climb was successfully created.' 
        }
        format.json { render action: 'show', status: :created, location: @climb }
      else
        format.html { render action: 'new' }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @climb.update(climb_params)
        format.html { redirect_to @climb, notice: 'Climb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @climb.destroy
    respond_to do |format|
      format.html { redirect_to climbs_url }
      format.json { head :no_content }
    end
  end

  private
    def set_climb
      @climb = Climb.find(params[:id])
    end

    def climb_params
      params.require(:climb).permit(:user_id, :problem_id, :attempted_on, :success, :grade, :comment)
    end
end
