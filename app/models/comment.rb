class Comment < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:ativo, :inativo]
  belongs_to :service
end
