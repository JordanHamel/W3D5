class User < ActiveRecord::Base
  has_many :responses
  validates :name, :presence => true

  # def self.create_user(name)
  #   user = User.new
  #   user.name = name
  #   user.save
  # end
  attr_accessible :name



  def self.print_responses(user)
    #a heredoc!
    user_responses = user.responses.includes(:poll, :allowed_response)

    user_responses.each do |user_response|
      puts "#{user_response.poll.text} | #{user_response.allowed_response.response}"

    end
    # sql = "
    # SELECT polls.text, allowed_responses.response, users.name
    # FROM users
    # JOIN responses
    #   ON users.id = responses.user_id
    # JOIN polls
    #   ON responses.poll_id = polls.id
    # JOIN allowed_responses
    #   ON allowed_responses.id = responses.allowed_responses_id
    # WHERE responses.user_id = #{user.id}
    #   "

    # thing = ActiveRecord::Base.connection.execute(sql, user.id)
    # puts "THING IS : #{thing.inspect}"
    # thing.each_with_index do |response, i|
    #   puts "#{i+1} | #{response['name']} answered #{response['response'].downcase} to the question #{response['text'].downcase}"
    # end
    puts
  end

end
