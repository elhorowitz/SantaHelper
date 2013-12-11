class Family < ActiveRecord::Base
	has_many :members, dependent: :destroy
	accepts_nested_attributes_for :members, allow_destroy: true, reject_if: lambda {|attributes| attributes[:all_blank].blank?}

	validates :name, presence: true, uniqueness: true
	validates_format_of :name, :with => /\A[a-zA-Z0-9_]{2,30}\Z/
	
	def to_param
		name
	end
end
