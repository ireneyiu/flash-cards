get '/terms' do
  @term = "This is my term"
  erb :"rounds/show"
end