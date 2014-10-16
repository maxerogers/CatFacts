class CatFact
  include Mongoid::Document

  field :fact, type: String
  field :test, type: String
end

class Client
  include Mongoid::Document

  field :id, type: String
  field :secret, type: String

end
