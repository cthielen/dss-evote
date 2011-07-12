class BallotIdStringToIntInPreferences < ActiveRecord::Migration
  def self.up
    change_column :preferences, :ballot_id, :integer
  end

  def self.down
    change_column :preferences, :ballot_id, :string
  end
end
