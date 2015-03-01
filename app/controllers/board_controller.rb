class BoardController < ApplicationController
  def index
    def new
      @provider = Provider.find_by(id: session[:provider_id])
      binding.pry
      if session[:provider_id]
        @new_board = Board.new
      else
        redirect_to :back
      end
    end
  end

  def create
    @board = Board.create(params_board)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def params_board
    params.require(:board).permit(:title, :provider_id, :consumer_id)
  end
end
