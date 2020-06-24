class Song < ActiveRecord::Base
    validates :artist, presence: true, length: { minimum: 2}
    validates :title, presence: true, length: { minimum: 2}

    has_many :playlists
    has_many :users, through: :playlists


    def get_total_added
        Playlist.where(song: self).count
    end
end
