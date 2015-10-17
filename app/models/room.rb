class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :toys

  validates :name, presence: true
  validates :number, numericality: { greater_than: 0, less_than: 200 }, presence: true, uniqueness: true

  after_create :set_available_toys_num

  private

    def set_available_toys_num
      self.toys.each do |toy|
        self.number_of_toys += toy.available_num
      end
      save
    end
end
