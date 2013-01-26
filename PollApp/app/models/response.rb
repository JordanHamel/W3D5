class Response < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user
  belongs_to :allowed_response
  validates :poll_id, :allowed_response_id, :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => :poll_id,
    :message => "user can't answer the same question twice" }
  #validate that user_id hasn't answered poll with same poll_id

  attr_accessible :poll_id, :allowed_response_id, :user_id


end