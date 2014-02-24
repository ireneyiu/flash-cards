## Tests

Really good work here.  You might be wondering "are we doing it right" because
the tests are small and focused.  "Surely it has to be more complex, right?"
At this point, no it does not :).  Over time, as apps get more complex you're
going to write more unit and controller specs.

It'd be common to create a spec file per model e.g. `deck.spec`, `card.spec`,
etc.

It's also cool that you've gone ahead to work with DB cleaner and `shoulda`
matchers.

## Huh?

What's going on with 

▾ flash_cards/
  ▾ spec/
      index_controller_spec.rb

Why's that guy not with the other specs?

## Separate your Migrations

Put your migrations in separate files create\_decks, create\_rounds, etc.

Remember single responsibility principle?  Also applicable to migrations.

## Put constraints in your DB

If something's required, set `:null => false`.  <3 use of `defaults`

## Sessions

* I like your creative use of session to store the last term.  There's a better
  tool for that called the "flash" hash.  But still, i liked your approach very
  much
* You're doing too much with this thing and not leveraging classes.  I've left
  a nubmer fo comments about ways around this.

## Views

* Yay partials, but use more
  * But cards/new could use an 'add_card'
  * decks/show a partial for the lis
  *
