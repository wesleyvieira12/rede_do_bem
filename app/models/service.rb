class Service < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:ativo, :inativo]
  has_many :comments, dependent: :destroy
  belongs_to :user_client, class_name: 'User', :foreign_key => 'user_client_id'
  belongs_to :user_professional, class_name: 'User', :foreign_key => 'user_professional_id'
end
