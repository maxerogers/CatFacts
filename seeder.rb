require 'mongoid'
require './catfact'
Mongoid.load!("./mongo.yml", :development)

CatFact.create(fact: "They Are Cute")
