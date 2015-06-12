class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates_uniqueness_of :song_id, scope: :user_id
end
