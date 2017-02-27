class User < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:active, :inactive]
  enum kind: [:client, :professional, :administrator]
  belongs_to :city
  belongs_to :category
  has_many :services
end
