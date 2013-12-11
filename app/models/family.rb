class Family < ActiveRecord::Base
	has_many :members, dependent: :destroy
	accepts_nested_attributes_for :members, allow_destroy: true, reject_if: lambda {|attributes| attributes[:all_blank].blank?}

	validates :name, presence: true, uniqueness: true
	
	def to_param
		name
	end
end
