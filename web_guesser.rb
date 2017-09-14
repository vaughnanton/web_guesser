require 'sinatra'

@@secret_number = rand(100)
@@count = 5

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  count_message = check_count(guess)
  erb :index, :locals => {:number => @@secret_number,
                          :message => message,
                          :count_message => count_message}
end

def check_guess(guess)
  if guess.nil?
    message = ""
  elsif  guess.to_i > (@@secret_number + 5)
    message = "You guess is way too high!"
  elsif guess.to_i > @@secret_number
    message = "Your guess is too high!"
  elsif guess.to_i < (@@secret_number - 5)
    message = "Your guess is way too low!"
  elsif guess.to_i < @@secret_number
    message = "Your guess is too low!"
  elsif guess.to_i == @@secret_number
    message = "Got it! The secret number is #{@@secret_number}... I was joking about entering the matrix, ya know."
  end
end

def check_count(guess)
  if guess.nil?
    ""
  elsif @@count > 1 && guess.to_i != @@secret_number
    @@count = @@count - 1
    "You have #{@@count} guesses left!"
  elsif @@count > 0 && guess.to_i == @@secret_number
    @@count = 5
    @@secret_number = rand(100)
    "I've generated a new number if you would like to play again."
  elsif @@count > 0 && guess.to_i != @@secret_number
    @@count = 5
    @@secret_number = rand(100)
    "You are out of guesses. Let me think of a new number... Okay, try again!"
  end
end
