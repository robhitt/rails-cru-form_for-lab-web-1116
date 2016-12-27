class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    indv_genre
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params(:name))
    redirect_to genres_path
  end

  def edit
    indv_genre
  end

  def update
    indv_genre
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

  def indv_genre
    @genre = Genre.find(params[:id])
  end
end
