

def prompt
  print " > "
  gets.chomp
end
# Run file GOGO
def create_poll
  poll = Poll.new
  puts "What would you like to call your poll?"
  poll.title = prompt

  puts "What's your question?"
  poll.text = prompt
  poll.save

  puts "How many answers to your question?"
  prompt.to_i.times do |num|
    resp = AllowedResponse.new
    puts "Allowable answer #{num}"
    resp.response = prompt
    resp.poll_id = poll.id
    resp.save
  end
end

def take_poll(user)
  Poll.all.each do |poll|
    puts "#{poll.id} | #{poll.title}"
  end
  puts
  puts "Select a poll to take!"
  poll_id = prompt.to_i
  puts

  Poll.find(poll_id).allowed_responses.each do |response|
    puts "#{response.id} | #{response.response}"
  end
  puts
  puts "Select your answer!"
  response_id = prompt.to_i
  puts Response.create(
      user_id: user.id,
      poll_id: poll_id,
      allowed_responses_id: response_id
    )
  puts
  puts "THANKS FOR TAKING OUR POLL!!!"

end

def view_users_polls
  puts "Enter username to view that user's polls:"
  username = prompt
  user = User.find_by_name(username)
  User.print_responses(user)
  puts
end

def view_most_popular_polls
  
end

puts "What is your username?"
username = prompt

# Go get the user object if it exists
user = User.find_by_name(username)
user = User.create(name: username) if user.nil?

#initial menu
puts "What would you like to do?"
choices = ["Create Poll", "Take poll", "View User's Polls", "Most Popular"]
choices.each_with_index do |choice, i|
  puts "#{i} | #{choice}"
end

puts


case prompt.to_i
when 0
  create_poll
when 1
  take_poll(user)
when 2
  view_users_polls
when 3
  view_most_popular_polls
end



