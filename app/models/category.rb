class Category < ApplicationRecord
	#Status : 0 (Ativo) e 1 (Inativo)
	enum status: [:ativo, :inativo]
	has_many :users
end