#This is the app.rb file. It is kind of like our bread and butter file.
#In sinatra we can do almost anything from this file though we generally parition
#things like configuration, databases and html/css/js stuff in other folders to keep this clean
require 'rubygems'
require 'bundler'
Bundler.require(:default)
require './catfact'

configure do
  Mongoid.load!("./mongo.yml", :development)
end

get '/' do
  "Hello World"
end

get "/random_cat_fact/?:num?" do
  content_type :json
  params[:num] ||= 1
  CatFact.all.pluck(:fact).sample(params[:num].to_i).to_json
end

#generate a new client id and secret

get '/generate_client' do
  content_type :json
  #Generate an array of a to z, A to Z and 0 and 9
  o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
  #now randomly pick 50 elements from the arry and combine them into a string
  client_secret = (0...50).map { o[rand(o.length)] }.join
  client_id = (0...25).map { o[rand(o.length)] }.join
  #create the new client object
  client = Client.create( client_id: client_id, secret: client_secret)
  if client #if the client was created then return the new secret & client
    {client_id: client_id, client_secret: client_secret}.to_json
  else
    {"message"=> "Failure"}.to_json
  end
end
