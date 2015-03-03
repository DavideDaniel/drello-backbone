module Api
  class LikesController < ApiController
    def create
      @likes = Like.new(like_params)

      if @likes.save
        render json: @likes
      else
        render json: @likes.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @like = Like.find(params[:id])
      @like.destroy
      render json: { message: 'destroyed!' }
    end

    private

    def like_params
      params.require(:like).permit(:done, :card_id, :consumer_id)
    end
  end
end
