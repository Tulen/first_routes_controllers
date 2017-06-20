class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :img_url, presence: true
  validates :artist_id, presence: true, uniqueness: {
    scope: :title, message: "For any given artist, artwork title must be unique"
  }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :viewer_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :viewer_shares,
    source: :viewer

end
