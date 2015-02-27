class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    if params[:password] == params[:confirm_password]
      @provider = Provider.create(params_user)
      redirect_to '/'

    else
      redirect_to '/signup'
    end
  end

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find_by(id: params[:id])
  end

  def params_user
    params.require(:provider).permit(:name, :password, :email)
  end
end
