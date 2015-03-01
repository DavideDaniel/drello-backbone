class SessionController < ApplicationController
  def new
      render :new
  end

  def create
    provider = Provider.find_by(email: params[:email])
    consumer = Consumer.find_by(email: params[:email])
    if provider && provider.authenticate(params[:password])
      session[:provider_id] = provider.id
      redirect_to provider
    elsif consumer && consumer.authenticate(params[:password])
      session[:consumer_id] = consumer.id
      redirect_to consumer
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :back
  end
end