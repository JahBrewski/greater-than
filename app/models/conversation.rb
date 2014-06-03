class Conversation < ActiveRecord::Base
  belongs_to :topic
  has_many :replies
end
