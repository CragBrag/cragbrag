class TagsController < ApplicationController
  before_action :set_user, except: :checkin
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = @user.tags.build(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to [@user, @tag], notice: 'Tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to [@user, @tag], notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to user_tags_url(@user) }
      format.json { head :no_content }
    end
  end

  def checkin
    tag = Tag.find_by! token: params[:token]
    climb = tag.user.climbs.build problem: Problem.first, success: true
    climb.save
    climb.publish_to_stream
    render json: climb.to_json(include: :user), status: 200
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_tag
    @tag = Tag.find params[:id]
  end

  def tag_params
    params.require(:tag).permit(:user_id, :name, :token)
  end
end
