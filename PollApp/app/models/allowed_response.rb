class AllowedResponse < ActiveRecord::Base
  belongs_to :polls
  has_many :responses

  attr_accessible :response, :poll_id
end