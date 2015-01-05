class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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
       redirect_to @roster
      else
       render action: 'new'
     end
  end

  def update
      if @roster.update(roster_params)
        redirect_to @roster, notice: 'Roster was successfully updated.'
      else
        format.html render :edit
      end
  end

  def destroy
    @roster.destroy
      redirect_to @roster, notice: 'Roster was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster
      @roster = Roster.find(params[:id])
    end

    def correct_user
      @roster = current_user.rosters.find_by(id: params[:id])
      redirect_to rosters_path, notice: "Not authorized to edit this pin" if @roster.nil?
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_params
      params.require(:roster).permit(:ranking, :name, :position)
    end
