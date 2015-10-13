class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :number, numericality: { greater_than: 0, less_than: 200 }, presence: true
end
