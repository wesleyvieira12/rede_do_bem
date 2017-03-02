class Service < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:ativo, :inativo]
  has_many :comments, dependent: :destroy
  has_many :image_services, dependent: :destroy
  belongs_to :user_client, class_name: 'User', :foreign_key => 'user_client_id'
  belongs_to :user_professional, class_name: 'User', :foreign_key => 'user_professional_id'

  accepts_nested_attributes_for :image_services, reject_if: :all_blank, allow_destroy: true
end
