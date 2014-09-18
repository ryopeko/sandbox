class Book < ActiveRecord::Base
  include Garage::Representer

  property :id
  property :title
end
