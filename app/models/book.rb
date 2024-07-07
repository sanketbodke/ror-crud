class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :price, type: String
end
