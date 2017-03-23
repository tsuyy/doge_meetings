class PlaydatesController < ApplicationController
  before_action :set_playdate, only: [:show, :edit, :update, :destroy]

  # GET /playdates
  # GET /playdates.json
  def index
    @playdates = Playdate.all
  end

  # GET /playdates/1
  # GET /playdates/1.json
  def show
  end

  # GET /playdates/new
  def new
    @playdate = Playdate.new
  end

  # GET /playdates/1/edit
  def edit
  end

  # POST /playdates
  # POST /playdates.json
  def create
    @playdate = Playdate.create(playdate_params)
    d
  end

  # PATCH/PUT /playdates/1
  # PATCH/PUT /playdates/1.json
  def update
    @playdate.update(playdate_params)
  end

  # DELETE /playdates/1
  # DELETE /playdates/1.json
  def destroy
    @playdate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playdate
      @playdate = Playdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playdate_params
      params.require(:playdate).permit(:location, :date, :description, :title, :user_id)
    end
end
