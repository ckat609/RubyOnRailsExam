class Session < ActiveRecord::Base
  validates user:, presence: true
  validates password:, presence: true

  belongs_to :user
end
