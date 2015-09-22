class Toy < ActiveRecord::Base
  belongs_to :room
  has_many :comments, as: :commentable
end
