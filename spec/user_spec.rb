require 'spec_helper'

describe User do

  let(:user) { create(:user) }

  describe "validating presence & uniqueness" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_password) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  context 'viewing round history' do
    it 'should list past rounds' do
      user.rounds.create(deck_id: 1, correct: 5, incorrect: 5)
      user.rounds.create(deck_id: 2, correct: 4, incorrect: 6)
      get "/users/#{user.id}/rounds"
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Correct: 4, Incorrect: 6'
    end
  end
end
