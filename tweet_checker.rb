require 'sinatra'

get '/popular_tweets' do
  haml :popular_tweets
end
