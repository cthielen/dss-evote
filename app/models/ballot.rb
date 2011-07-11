class Ballot < ActiveRecord::Base
  belongs_to :survey
  has_many :preferences
  
  accepts_nested_attributes_for :preferences, :allow_destroy => true
end
