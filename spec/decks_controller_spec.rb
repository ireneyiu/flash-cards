require 'spec_helper'

describe 'DecksController' do

  let(:user) { create(:user) }
  let(:deck) { create(:deck) }
  let(:card) { create(:card) }
  let(:session) {{ 'rack.session' => {id: deck.user_id } }}

  describe 'add deck functionality' do
    let!(:deck_attrs) { attributes_for(:deck) }

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
      expect{
        post('/decks', {})
      }.not_to change{Deck.count}.by(1)
    end

  end

  describe 'add card functionality' do
    it 'should display the add card form' do
      get "/decks/#{deck.id}/cards/new", "", session
      expect(last_response.body).to include('New Card')
    end

    it 'should add a valid card' do
      expect{
        post("/decks/#{deck.id}/cards", {term: "My new term", description:  "My new"})
      }.to change(deck.cards, :count).by(1)
    end

    it 'should not add an invalid card' do
      expect{
        post("/decks/#{deck.id}/cards", {term: "My new term"})
      }.not_to change(deck.cards, :count).by(1)
    end
  end

end
