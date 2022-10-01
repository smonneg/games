class Api::GamesController < ActionController::API
  def index
    render json: Game.all
  end

  def create
    render json: Game.create(game_attributes)
  end

  def update
    render json: Game.update(params[:id], game_attributes)
  end

  def destroy
    game = Game.find(params[:id])

    game.destroy

    render json: game
  end

  def search
    render json: Game.search(params[:platform], params[:name])
  end

  private

  def game_attributes
    params.require(:game).permit(
      :publisher_id,
      :name,
      :platform,
      :store_id,
      :bundle_id,
      :app_version,
      :is_published
    )
  end
end
