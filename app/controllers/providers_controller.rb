class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    if params[:password] == params[:confirm_password]
      @provider = Provider.create(params_provider)
      redirect_to '/providers'

    else
      redirect_to '/signup'
    end
  end

  def index
    @providers = Provider.all
  end


  def dash
    @provider = Provider.find_by(id: params[:id])
  end

  def show

    @provider = Provider.find_by(id: params[:id])
    @consumers = Consumer.where(provider_id: params[:id])

  end



  def params_provider
    params.require(:provider).permit(:name, :password, :email)
  end
end
