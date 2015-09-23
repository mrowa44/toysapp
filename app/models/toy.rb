class Toy < ActiveRecord::Base
  belongs_to :room
  has_many :comments, as: :commentable

  validates :room_id, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: true
  validates :name, presence: true, length: { maximum: 200 }, uniqueness: true
  validates :available_num, numericality: { greater_than: 0, less_than: 1000000 }

  before_create do
    self.color = 'not defined' if self.color.nil?
    self.room.number_of_toys += self.available_num
  end
end
