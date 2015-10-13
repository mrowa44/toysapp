require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number }
  it { should_not allow_value(0).for(:number) }
  it { should_not allow_value(201).for(:number) }
  it { should validate_numericality_of(:number) }
end
