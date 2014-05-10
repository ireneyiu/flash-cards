require 'spec_helper'

describe 'DecksController' do

  let(:user) { FactoryGirl.create(:user) }
  let(:deck) { FactoryGirl.create(:deck) }
  let(:card) { FactoryGirl.create(:card) }
  let(:session) {{ 'rack.session' => {id: deck.user_id } }}

  describe 'add deck functionality' do
    let!(:deck_attrs) { FactoryGirl.attributes_for(:deck) }

    it 'should display the add deck form' do
      get '/decks/new'
      expect(last_response.body).to include('New Deck')
    end

    it 'should add a deck when given a name' do
      expect{
        post('/decks', deck_attrs)
      }.to change{Deck.count}.by(1)
    end

    it 'should not add a deck with no name' do
      params = {}
      expect{
        post('/decks', params)
      }.not_to change{Deck.count}.by(1)
    end

  end

  describe 'add card functionality' do
    it 'should display the add card form' do
      get "/decks/#{deck.id}/cards/new", "", session
      expect(last_response.body).to include('New Card')
    end

    it 'should add a valid card' do
      deck_id = Deck.last.id
      params = {
        term:         "termdfgh #{deck_id}",
        description:  "descriptlkdbjion #{deck_id}",
        deck_id:      "#{deck_id}"
      }
      expect{
        post("/decks/#{deck_id}/cards", params)
      }.to change(Deck.find(deck_id).cards, :count).by(1)
    end

    it 'should not add an invalid card' do
      deck_id = Deck.last.id
      params = {
        term:         "termdfgh #{deck_id}",
        deck_id:      "#{deck_id}"
      }
      expect{
        post("/decks/#{deck_id}/cards", params)
      }.not_to change(Deck.find(deck_id).cards, :count).by(1)
    end
  end

end
