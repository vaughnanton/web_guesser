require 'sinatra'
require 'sinatra/reloader'

$secret_number = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => $secret_number, :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  number = $secret_number
  range = 5
  if guess > (number + range)
    message = "Way Too High!"
  elsif guess > number
    message = "Too High"
  elsif guess < (number - range)
    message = "Way Too Low!"
  elsif guess < number
    message = "Too Low"
  else
    message = "You got it! The secret number is #{number}... I was joking about entering the matrix, ya know."
  end
end
