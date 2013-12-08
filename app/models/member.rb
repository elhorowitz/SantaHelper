class Member < ActiveRecord::Base
  belongs_to :family
  has_many :presents, dependent: :destroy
  accepts_nested_attributes_for :presents, allow_destroy: true, reject_if: lambda {|attributes| attributes[:all_blank].blank?}
  
  
  validates :usrname, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5}
  
end
