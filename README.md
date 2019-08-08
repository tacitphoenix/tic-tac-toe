# Tic-Tac-Toe API

## Completed

1. Interface for providing board as url string
2. Validation and plausibility of board string
4. Win conditions part of the game engine
3. Test to verify the above

# Tests

ruby test_tic_tac_toe.rb


## Pending

1. Next move part of the game engine
2. Convert to Sinatra (Ruby Micro Webframework)
3. Deploy on Heroku

## Thoughts

I don't envision much code being required for the next move part of the game
engine considering the win condition part is done and I have some reusable
part for next move. Conversion to Sinatra is also not that bad considering
this is a stateless API which just validate and responses to the client based
on the board query string. Sinatra deployment on Heroku is pretty straightforward.
I generally prefer TDD on programs that require some intertwined logic this takes
a little bit of time to setup but as I progress it enabled me to make some
sweeping refactors. I have documented my progress as the zip file is a local
git repo and stopped at the recommended 2 hour mark.
