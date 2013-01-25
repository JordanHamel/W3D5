class Poll < ActiveRecord::Base
  has_many :responses
  has_many :allowed_responses

  attr_accessible :title, :text

  # returns the top 10 most responded to questions
  def self.most_popular

  end

end