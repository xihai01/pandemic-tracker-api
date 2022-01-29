class Api::MapsController < ApplicationController
  def index
    render :json => @@data
  end
end
