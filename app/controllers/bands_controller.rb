class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(name)
    if band.save
      render :new
    else
      render json: band.errors.full_message
    end
  end

  def new
    render :new
  end

  def edit
    
    render :edit
  end

  def show
    band = Band.find(params[:id])
    render :show
  end

  def update
    band = Band.find(params[:id])
    if band.update(name)
      render :edit
    else
       render json: band.errors.full_message 
    end
  end

  def destroy
    band = Band.find(params[:id])   
    if band 
      band.destroy
      redirect_to band_url
    else
      render json: 'band not found', status:404
    end
  end

end