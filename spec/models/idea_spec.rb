require 'spec_helper'

describe Idea do
  it { should validate_presence_of(:topic) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:title) }
end
