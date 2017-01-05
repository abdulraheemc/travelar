class Pilgrim < ActiveRecord::Base
	belongs_to :packages
	has_many :copilgrims, class_name: "Pilgrim", foreign_key: :copilgrim_id
	accepts_nested_attributes_for :copilgrims, :allow_destroy => true, reject_if: :all_blank
	has_attached_file :passport_image, styles: { medium: "300x300>" }
end
