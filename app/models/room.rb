class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :toys

  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
end
