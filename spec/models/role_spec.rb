require 'spec_helper'

describe Role do
  it { should validate_presence_of (:user) }
  it { should validate_presence_of (:topic) }
end
