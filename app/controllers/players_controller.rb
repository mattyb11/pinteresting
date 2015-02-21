class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @qb = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'QB'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @rb1 = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'RB'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @rb2 = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'RB'
      AND positional_ranking = 2
      AND owner = 'Matt'")
  
    @wr1 = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'WR'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @wr2 = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'WR'
      AND positional_ranking = 2
      AND owner = 'Matt'")

    @te = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'TE'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @flex = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE (position = 'RB' AND positional_ranking != 1 AND positional_ranking != 2)
      OR (position = 'WR' AND positional_ranking != 1 AND positional_ranking != 2)
      OR (position = 'TE' AND positional_ranking != 1)
      AND owner = 'Matt'
      GROUP BY overall_ranking, players.id")

    @dl = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'DL'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @lb = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'LB'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @db = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'DB'
      AND positional_ranking = 1
      AND owner = 'Matt'")

    @k = Player.find_by_sql(
      "SELECT *
      FROM players
      WHERE position = 'K'
      AND positional_ranking = 1
      AND owner = 'Matt'")
      
  end

  def rankings
    @players = Player.find_by_sql(
      "SELECT player, position, overall_ranking, positional_ranking, owner
      FROM players
      WHERE owner = 'Matt'
      GROUP BY overall_ranking")
  end

  def depthchart
    @players = Player.find_by_sql(
      "SELECT player, position, overall_ranking, positional_ranking, owner
      FROM players
      WHERE owner = 'Matt'
      GROUP BY overall_ranking")
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
      if @player.save
        redirect_to new_player_path, notice: 'Player was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to players_path, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:player, :position, :overall_ranking, :positional_ranking, :owner) if params[:player]
    end
  end
