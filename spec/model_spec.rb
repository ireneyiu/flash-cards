require 'spec_helper'

describe Card do
  it { should validate_presence_of(:term) }
  it { should validate_uniqueness_of(:term) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:deck_id) }
end

describe Deck do
  it { should validate_presence_of(:name) }
end

describe Round do
  it { should validate_presence_of(:deck_id) }
end

