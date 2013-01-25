class AllowedResponse < ActiveRecord::Base
  belongs_to :polls

  attr_accessible :response, :poll_id
end