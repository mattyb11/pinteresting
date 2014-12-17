class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy]

  def index
    @rosters = Roster.all
  end


  def show
  end

  def new
    @roster = Roster.new
  end

  def edit
  end

  def create
    @roster = Roster.new(roster_params)

      if @roster.save
        format.html redirect_to @roster, notice: 'Roster was successfully created.'
      else
        format.html render :new
      end
  end

  def update
      if @roster.update(roster_params)
        format.html redirect_to @roster, notice: 'Roster was successfully updated.'
      else
        format.html render :edit
      end
  end

  def destroy
    @roster.destroy
      format.html redirect_to rosters_url, notice: 'Roster was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster
      @roster = Roster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_params
      params.require(:roster).permit(:ranking, :name, :position)
    end
