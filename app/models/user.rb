class User < ApplicationRecord
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
end
