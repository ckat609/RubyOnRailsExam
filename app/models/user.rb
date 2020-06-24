class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :fname, presence: true, length: {minimum: 2}
  validates :lname, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password, presence: true
  has_secure_password

  has_many :playlists
  has_many :songs, through: :playlists

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  def get_total_added song
    Playlist.where(user: self, song: song).count
  end

end
