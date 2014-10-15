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
