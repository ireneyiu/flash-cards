require 'spec_helper'

describe 'DecksController' do

  let(:user) { FactoryGirl.create(:user) }
  let(:card) { FactoryGirl.create(:card) }
  let!(:user_attrs) { FactoryGirl.attributes_for(:user) }
  let!(:deck_attrs) { FactoryGirl.attributes_for(:deck) }

  describe 'add deck functionality' do

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
      get '/decks/:deck_id/cards/new'
      expect(last_response.body).to include "New Card"
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
