class AllowedResponse < ActiveRecord::Base
  belongs_to :polls
  has_many :responses
  validates :response, :poll_id, :presence => true

  attr_accessible :response, :poll_id
end