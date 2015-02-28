class ConsumersController < ApplicationController
  def new
    @consumer = Consumer.new
  end

  def create
    if params[:password] == params[:confirm_password]
      @consumer = Consumer.create(params_consumer)
      redirect_to '/show'

    else
      redirect_to '/consumer/signup'
    end
  end

  def index
    @consumers = Consumer.all
  end

  def show
    @consumer = Consumer.find_by(id: params[:id])

  end

  def params_consumer
    params.require(:consumer).permit(:name, :password, :email, :provider)
  end
end
