class Slider < ApplicationRecord
	has_many :image_sliders, dependent: :destroy

	accepts_nested_attributes_for :image_sliders, reject_if: :all_blank, allow_destroy: true
end
