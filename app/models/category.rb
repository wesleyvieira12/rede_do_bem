class Category < ApplicationRecord
	require 'carrierwave/orm/activerecord'

	mount_uploader :foto, FotoUploader
	#Status : 0 (Ativo) e 1 (Inativo)
	enum status: [:ativo, :inativo]
	has_many :users
end