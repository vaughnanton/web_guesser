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
    message = "You guess is way too high!"
  elsif guess > number
    message = "Your guess is too high!"
  elsif guess < (number - range)
    message = "Your guess is way too low!"
  elsif guess < number
    message = "Your guess is too low!"
  else
    message = "You got it! The secret number is #{number}... I was joking about entering the matrix, ya know."
  end
end
