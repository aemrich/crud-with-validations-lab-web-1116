class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.save
      redirect_to @song
    else
      render :edit
    end

    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_path
    end
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
