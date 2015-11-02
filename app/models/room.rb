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
      sql = "SELECT SUM(a.toys_count)
      FROM (SELECT SUM(available_num) AS toys_count
      FROM toys
      WHERE room_id = #{self.id}
      GROUP BY toys.id)
      a"
      toys_count = ActiveRecord::Base.connection.execute(sql).values.flatten.first
      self.number_of_toys = toys_count
      save
    end

    def check_if_number_positive
      unless Room.connection.execute("SELECT * FROM information_schema.check_constraints WHERE constraint_name = 'positive'").any?
        Room.connection.execute("ALTER TABLE rooms ADD CONSTRAINT positive CHECK (number > 0)")
      end
    end
end
