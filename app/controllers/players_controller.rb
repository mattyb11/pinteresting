class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @qb = Player.all.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'QB'
      AND positional_ranking = 1")

    @rb1 = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'RB'
      AND positional_ranking = 1")

    @rb2 = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'RB'
      AND positional_ranking = 2")
  
    @wr1 = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'WR'
      AND positional_ranking = 1")

    @wr2 = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'WR'
      AND positional_ranking = 2")

    @te = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'TE'
      AND positional_ranking = 1")

    @flex = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE (position = 'RB' AND positional_ranking != 1 AND positional_ranking != 2)
      OR (position = 'WR' AND positional_ranking != 1 AND positional_ranking != 2)
      OR (position = 'TE' AND positional_ranking != 1)
      GROUP BY overall_ranking")

    @dl = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'DL'
      AND positional_ranking = 1")

    @lb = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'LB'
      AND positional_ranking = 1")

    @db = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'DB'
      AND positional_ranking = 1")

    @k = Player.find_by_sql(
      "SELECT player
      FROM players
      WHERE position = 'K'
      AND positional_ranking = 1")
  end


  def rankings
    @players = Player.all.order("overall_ranking")
  end

  def depthchart
    @players = Player.all.order("overall_ranking")
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @players, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @players, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.delete
    respond_to do |format|
      format.html { redirect_to @players, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:player, :position, :overall_ranking, :positional_ranking)
    end
  end
