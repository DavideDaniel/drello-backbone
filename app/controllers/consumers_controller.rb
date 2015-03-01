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
    render :edit
  end

  def update
    @consumer = Consumer.find_by(id: params[:id])
    if @consumer.update_attributes(params_consumer)
      respond_with @consumer, notice: "Success"
    else
      render :edit
    end
  end

  def show
    @consumer = Consumer.find_by(id: params[:id])
  end

  def params_consumer
    params.require(:consumer).permit(:name, :password, :email, :provider_id)
  end
end
