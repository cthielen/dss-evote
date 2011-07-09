class Ballot < ActiveRecord::Base
  belongs_to :survey
  has_many :preferences
end
