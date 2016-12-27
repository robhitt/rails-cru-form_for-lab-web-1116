class SongsController < ApplicationController

  def index
      @songs = Song.all
  end

  def show
    indv_song
    @genre = @song.genre
    @artist = @song.artist
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:name, :artist_id, :genre_id))
    redirect_to songs_path
  end

  def edit
    indv_song
  end

  def update
    indv_song
    @song.update(song_params(:name, :artist_id, :song_id))
    redirect_to song_path(@song)
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def indv_song
    @song = Song.find(params[:id])
  end
end
