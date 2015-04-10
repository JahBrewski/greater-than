class Profile < ActiveRecord::Base
  validates_presence_of :age, :location
  belongs_to :user
end
