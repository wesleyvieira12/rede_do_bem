class ImageSlider < ApplicationRecord
	
	require 'carrierwave/orm/activerecord'

	belongs_to :slider

	mount_uploader :figure, FigureUploader

end
