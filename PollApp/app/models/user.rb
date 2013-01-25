class User < ActiveRecord::Base
  has_many :responses

  # def self.create_user(name)
  #   user = User.new
  #   user.name = name
  #   user.save
  # end
  attr_accessible :name



  def self.print_responses(user)
    #a heredoc!
    sql = (<<-SQL)
    SELECT polls.text, allowed_responses.response, users.name
    FROM users
    JOIN responses
      ON users.id = responses.user_id
    JOIN polls
      ON responses.poll_id = polls.id
    JOIN allowed_responses
      ON allowed_responses.id = responses.allowed_responses_id
      SQL

    thing = ActiveRecord::Base.connection.execute(sql)
    thing.each_with_index do |response, i|
      puts "#{i+1} | #{response['name']} answered #{response['response'].downcase} to the question #{response['text'].downcase}"
    end
    nil
  end

end
