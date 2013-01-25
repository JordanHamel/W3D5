class Response < ActiveRecord::Base
  belongs_to :polls
  belongs_to :users

  attr_accessible :poll_id, :allowed_responses_id, :user_id

  
end