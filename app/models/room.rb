class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :comments, as: :commentable
end
