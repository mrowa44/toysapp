class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
end
