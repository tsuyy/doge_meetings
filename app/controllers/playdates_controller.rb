class PlaydatesController < ApplicationController
  before_action :set_playdate,    only: [:show, :edit, :update, :destroy]
  before_action :is_current_user, only: [       :edit,          :destroy]

  # GET /playdates
  def index
    @playdates = Playdate.all
  end

  # GET /playdates/1
  def show
  end

  # GET /playdates/new
  def new
    @playdate = Playdate.new(user_id: params[:user_id])
  end

  # GET /playdates/1/edit
  def edit
  end

  # POST /playdates
  def create
    playdate = playdate_params
    playdate[:user_id] = params[:user_id]
    @playdate = Playdate.create(playdate)
    redirect_to user_path(@playdate.user)

  end

  # PATCH/PUT /playdates/1
  def update
    @playdate.update(playdate_params)
    redirect_to user_path(@playdate.user)
  end

  # DELETE /playdates/1
  def destroy
    @playdate.destroy
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
