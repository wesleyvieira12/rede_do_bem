class State < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:active, :inactive]
  has_many :cities
end
