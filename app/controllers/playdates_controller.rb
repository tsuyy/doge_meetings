class PlaydatesController < ApplicationController
  before_action :set_playdate,    only: [:show, :edit, :update, :destroy]
  before_action :is_current_user, only: [       :edit, :update, :destroy]

  # GET /playdates
  def index
    @playdates = Playdate.all
  end

  # GET /playdates/1
  def show
  end

  # GET /playdates/new
  def new
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
    @playdate = Playdate.new(user_id: params[:user_id], date: Time.now.strftime("%d/%m/%Y %H:%M"))
  end

  # GET /playdates/1/edit
  def edit
  end

  # POST /playdates
  def create
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
    playdate = playdate_params
    playdate[:user_id] = params[:user_id]
    @playdate = Playdate.new(playdate)
    if @playdate.save
      Invite.create(user_id: params[:user_id], playdate_id: @playdate.id, status: 1)
      redirect_to user_path(current_user)
    else
      flash[:error] = "Not Valid Playdate Info"
      redirect_to user_path(current_user)
    end
  end

  # PATCH/PUT /playdates/1
  def update
    @playdate.update(playdate_params)
    redirect_to user_path(@playdate.user)
  end

  # DELETE /playdates/1
  def destroy
    @playdate.destroy
    flash[:success] = "Playdate gone!"
    redirect_to user_path(@playdate.user)
  end

  private
    def is_current_user
      @playdate = Playdate.find_by_id(params[:id])
      if !current_user || current_user != @playdate.user
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_playdate
      @playdate = Playdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playdate_params
      params.require(:playdate).permit(:location, :date, :description, :title, :user_id)
    end
end
