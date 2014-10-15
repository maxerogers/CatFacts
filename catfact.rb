class CatFact
  include Mongoid::Document

  field :fact, type: String
  field :test, type: String
end
