class Image < ApplicationRecord

	belongs_to :location
	
  	mount_uploader :titre, PhotoUploader

end
