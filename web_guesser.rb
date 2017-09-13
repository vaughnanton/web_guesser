require 'sinatra'
require 'sinatra/reloader'

num = rand(100).to_s

get '/' do
  erb :index, :locals => {:num => num}
end
