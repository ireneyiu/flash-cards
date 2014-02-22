get '/' do
  # Look in app/views/index.erb
  erb :index
end

# Controller sends the card into page.
# If guess.empty?
  # Show front of card
  # Submit post with guess
  # Redirect back
# otherwise
  # show back of card
  # show next link
# end