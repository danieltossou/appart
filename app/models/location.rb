class Location < ApplicationRecord

  paginates_per 10

  mount_uploader :photo, PhotoUploader

  default_scope { order(created_at: :desc) }
  scope :dispo, -> { where(:etat => 1)}

  has_many :reservations

end
