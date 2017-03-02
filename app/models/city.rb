class City < ApplicationRecord
  #Status : 0 (Ativo) e 1 (Inativo)
  enum status: [:ativo, :inativo]
  belongs_to :state
  has_many :users

  def city_state
  	 "#{name} - #{state.name}"
  end
end
