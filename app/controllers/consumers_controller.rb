class ConsumersController < ApplicationController
  respond_to :html, :json

  def new
    @consumer = Consumer.new
  end

  def create
    if params[:password] == params[:confirm_password]
      @consumer = Consumer.create(params_consumer)
      redirect_to @consumer

    else
      redirect_to '/consumers/new'
    end
  end

  def index
    @consumers = Consumer.all
  end

  def edit
    @consumer = Consumer.find_by(id: params[:id])

    if session[:provider_id] == @consumer.provider_id
    else
      redirect_to '/'
    end

  end

  def update
    @consumer = Consumer.find_by(id: params[:id])
    if @consumer.update_attributes(params_consumer)
      respond_to do |format|
        format.html { redirect_to :back}
        format.json { respond_with_bip(@consumer) }
      end
    else
      render :show
    end
  end

  def show
    @consumer = Consumer.find_by(id: params[:id])
  end

  

  def destroy
    @consumer = Consumer.find_by(id: params[:id])

    Consumer.destroy(params[:id])


    redirect_to provider_path
  end

  def params_consumer
    params.require(:consumer).permit(:name, :password, :email, :provider_id, :birthday, :gender)
  end
end
