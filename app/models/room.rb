class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :toys

  validates :name, presence: true
  validates :number, numericality: { greater_than: 0, less_than: 200 }, presence: true, uniqueness: true

  after_create :set_available_toys_num
  before_save :check_if_number_positive

  private

    def set_available_toys_num
      self.toys.each do |toy|
        self.number_of_toys += toy.available_num
      end
      save
    end

    def check_if_number_positive
      unless Room.connection.execute("SELECT * FROM information_schema.check_constraints WHERE constraint_name = 'positive'").any?
        Room.connection.execute("ALTER TABLE rooms ADD CONSTRAINT positive CHECK (number > 0)")
      end
    end
end
