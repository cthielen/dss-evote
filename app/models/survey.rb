class Survey < ActiveRecord::Base
  has_many :questions
  has_many :eligibilities
  has_many :ballots

  accepts_nested_attributes_for :ballots, :questions, :allow_destroy => true
  
  attr_accessible :title, :description, :status, :deadline, :questions_attributes
  
  def owner
    Person.find(owner_id)
  end
end
