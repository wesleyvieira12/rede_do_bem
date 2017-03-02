class ImageService < ApplicationRecord
	require 'carrierwave/orm/activerecord'

	belongs_to :service

	mount_uploader :avatar, AvatarUploader
end
