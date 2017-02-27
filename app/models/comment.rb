class Comment < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:active, :inactive]
  belongs_to :service
end
