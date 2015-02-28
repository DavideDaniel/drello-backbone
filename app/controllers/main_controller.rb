class MainController < ApplicationController

  def index
    session[:page_id] = '/'
  end

end
