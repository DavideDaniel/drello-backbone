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

  def edit
    @consumer = Consumer.find_by(id: params[:id])
  end
  
  def update
    @consumer = Consumer.find_by(id: params[:id])
    @consumer.update_attributes(params_consumer)

    redirect_to provider_show_path
  end

  def show
    @consumer = Consumer.find_by(id: params[:id])

  end

  def params_consumer
    params.require(:consumer).permit(:name, :password, :email, :provider_id)
  end
end
