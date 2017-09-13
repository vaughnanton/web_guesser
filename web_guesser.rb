require 'sinatra'
require 'sinatra/reloader'

num = rand(100).to_s

get '/' do
  "The secret number is " + num
end
