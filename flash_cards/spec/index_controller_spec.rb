require  'spec_helper'

describe 'IndexController' do
  describe 'show home page' do
    context 'logged in' do
      it 'should show the decks' do
        get '/'
        expect(last_response.body).to include('Decks')
      end
    end
    context 'not logged in' do
      it 'should show the login form' do
        get '/'
        expect(last_response.body).to include('Login')
      end
    end
  end

  describe 'show signup page' do
    it 'should show the signup page' do
      get '/signup'
      expect(last_response.body).to include('Sign Up')
    end
  end

  describe 'sign up user' do
    context 'missing password' do
      # todo: fix weird problem with name not recognized in params
      it 'should not create a new user' do
        post '/signup', {name: 'bob'}
        expect(last_response.body).to include('Invalid')
      end
    end
    context 'valid credientials' do
      it 'should create a new user' do
        post '/signup', {name: 'bob', user_password: '123'}
        follow_redirect!
        expect(last_response.body).to include('Decks')
      end
    end
  end
end