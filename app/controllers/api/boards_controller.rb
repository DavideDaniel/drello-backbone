module Api
  class BoardsController < ApiController
    
    def create
      provider = Provider.find_by(id: session[:provider_id])
      @board = provider.boards.new(board_params)

      if @board.save
        render json: @board
      else
        render json: @board.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      provider = Provider.find_by(id: session[:provider_id])
      @board = provider.boards.find(params[:id])
      @board.try(:destroy)
      render json: {}
    end

    def index
      provider = Provider.find_by(id: session[:provider_id])
      @boards = provider.boards
      render json: @boards
    end

    def show
      @board = Board.includes(:viewers, lists: :cards).find(params[:id])

      if @board.is_viewer?(current_user)
        render :show
      else
        render json: ["You aren't allowed to view this board"], status: 403
      end
    end

    private

    def board_params
      params.require(:board).permit(:title, :provider_id, :consumer_id)
    end
  end
end
