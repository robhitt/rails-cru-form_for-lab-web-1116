class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    indv_artist
  end

  def new
    @artist = Artist.new
  end

  def create
      @artist = Artist.create(artist_params(:name, :bio))
      redirect_to artists_path
  end

  def edit
    indv_artist
  end

  def update
    indv_artist
    @artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end


  private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end


  def indv_artist
    @artist = Artist.find(params[:id])
  end
end
