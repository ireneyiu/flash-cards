require 'spec_helper'

##THESE TESTS ARE NO LONGER WORKING
# I have tried getting factory girl and clean_database to reset the database
# and re-seed it every test, but it still keeps saying that Name has already
# been taken. When I remove that validation from the user model, it just says
# that nil is not a symbol.

# Nothing is really printing, and so I've been spinning my wheels for a couple
# of hours now and am giving up on it for the day. I may revisit the tests later
# on after I've got more practice with testing.

describe 'DecksController' do
  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create(:card)
  end


  describe 'add deck functionality' do
    let(:user_attrs){FactoryGirl.attributes_for(:user)}
    let(:deck_attrs){FactoryGirl.attributes_for(:deck)}

    it 'should display the add deck form' do

      get '/decks/new'
      expect(last_response.body).to include('New Deck')
    end

    it 'should add a deck when given a name' do
      expect{ post('/decks', deck_attrs) }.to change(Deck.count).by(1)
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
