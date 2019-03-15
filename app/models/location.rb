class Location < ApplicationRecord

  paginates_per 10

  mount_uploader :photo, PhotoUploader
end
