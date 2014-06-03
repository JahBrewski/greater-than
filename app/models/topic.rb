class Topic < ActiveRecord::Base
  has_many :conversations
end
