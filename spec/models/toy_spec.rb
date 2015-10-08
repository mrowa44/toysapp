require 'rails_helper'

RSpec.describe Toy, type: :model do
  it { should validate_presence_of(:room_id) }
  it { should validate_numericality_of(:price) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(200) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_numericality_of(:available_num) }
  it { should_not allow_value(-1).for(:available_num) }
  it { should_not allow_value(1000001).for(:available_num) }
end
