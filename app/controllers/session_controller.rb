class SessionController < ApplicationController
  def new
      render :new
  end

  def create
    provider = Provider.find_by(email: params[:email])

    if provider && provider.authenticate(params[:password])
      session[:provider_id] = provider.id
      redirect_to provider
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :back
  end
end