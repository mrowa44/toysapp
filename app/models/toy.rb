class Toy < ActiveRecord::Base
  default_scope { where active: true }

  belongs_to :room, touch: true
  has_many :comments, as: :commentable

  validates :room_id, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: true
  validates :name, presence: true, length: { maximum: 200 }, uniqueness: true
  validates :available_num, numericality: { greater_than: 0, less_than: 1000000 }

  before_create :set_color, :set_available_toys_num

  mount_uploader :image, ImageUploader

  def destroy
    update(active: false)
  end

  def cached_toy_room_name
    Rails.cache.fetch([self, 'room_name']) { self.room.name }
  end

  private

    def set_color
      self.color = 'not defined' if self.color.nil?
    end

    def set_available_toys_num
      if self.room.number_of_toys.nil?
        self.room.number_of_toys = self.available_num
      else
        self.room.number_of_toys += self.available_num
      end
    end
end
