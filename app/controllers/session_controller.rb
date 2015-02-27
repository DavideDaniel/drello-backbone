class SessionController < ApplicationController
  def new
    if !session[:provider_id]
      render :new
    else
      redirect_to session[:page_id]
    end
  end

  def create
    provider = Provider.find_by(email: params[:email])
    if provider && provider.authenticate(params[:password])
      session[:provider_id] = provider.id
      redirect_to session[:page_id]
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :back
  end
end