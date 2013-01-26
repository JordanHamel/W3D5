class Response < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user
  belongs_to :allowed_response

  attr_accessible :poll_id, :allowed_responses_id, :user_id


end