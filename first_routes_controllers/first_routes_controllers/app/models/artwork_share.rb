class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true, uniqueness: {
    scope: :artwork_id,
    message: "User cannot have artwork shared with them more than once"
  }

    belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

    belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

end
