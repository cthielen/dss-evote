class Preference < ActiveRecord::Base
  belongs_to :ballot
  belongs_to :question
end
