class Member < ActiveRecord::Base
  belongs_to :family
  has_many :presents, dependent: :destroy
  accepts_nested_attributes_for :presents, allow_destroy: true, reject_if: lambda {|attributes| attributes[:all_blank].blank?}
  
  
  validates :usrname, presence: true, uniqueness: true
  validates_format_of :usrname, :with => /\A[a-zA-Z0-9_]{2,30}\Z/
  validates :password, presence: true, length: { minimum: 5}
  
	def to_param
		usrname
	end
  
end
