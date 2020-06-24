class SongsController < ApplicationController
  def index
    @songs = Song.all.order("created_at DESC")
  end

  def new
  end

  def create
    song = Song.new(song_params)
    if song.save
      flash[:notice] = ["#{song_params[:artist]} - #{song_params[:title]} has been added successfully to the hub!"]
    else
      flash[:errors] = song.errors.full_messages
    end
    redirect_to songs_index_path
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def song_params
      params.require(:song).permit(:artist, :title)
    end
end
