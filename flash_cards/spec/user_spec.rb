require 'spec_helper'

describe User do

  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:user_password) }
  it { should validate_uniqueness_of(:name) }

  context 'viewing round history' do
    it 'should list past rounds' do
      p @user.rounds.create(deck_id: 1, correct: 5, incorrect: 5)
      p @user.rounds.create(deck_id: 2, correct: 4, incorrect: 6)
      get "/users/#{@user.id}/rounds"

      expect(last_response).to be_ok
      expect(last_response.body).to include 'Correct: 4, Incorrect: 6'
    end
  end
end
