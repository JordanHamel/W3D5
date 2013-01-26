class Poll < ActiveRecord::Base
  has_many :responses
  has_many :allowed_responses

  attr_accessible :title, :text

  # returns the top 10 most responded to questions
  def self.most_popular

  end



end

# SELECT polls.text
# FROM polls
#   JOIN responses
#   ON polls.id = responses.poll_id
#   GROUP BY polls.text
#   ORDER BY COUNT(responses.poll_id) DESC;