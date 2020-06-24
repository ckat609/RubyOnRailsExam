class PlaylistsController < ApplicationController
  def index
  end

  def new
  end

  def create
    song = Playlist.create(song: Song.find(params[:id]), user: current_user)
    flash[:notice] = ["#{Song.find(params[:id]).artist} - #{Song.find(params[:id]).title} has been added successfully to your playlist!"]
    redirect_to playlists_show_path(current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    Playlist.find_by(user: current_user, song: Song.find(params[:id])).destroy
    redirect_to playlists_show_path(current_user.id)
  end
  
  private
  
  def playlist_params
      params.require(:playlist).permit(song_id: params[:id])
    end
end
