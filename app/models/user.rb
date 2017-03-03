class User < ApplicationRecord

  require 'carrierwave/orm/activerecord'

  mount_uploader :perfil, PerfilUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:ativo, :inativo]
  enum kind: [:cliente, :professional, :administrator]
  belongs_to :city
  belongs_to :category
  has_many :services

  def active_for_authentication? 
    super && status=='ativo'
    :approved
  end 

  def inactive_message 
    if status=='inativo'
      :not_approved 
    else 
      super
    end 
  end

end
