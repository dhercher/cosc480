# describe "#rps_game_winner" do
#   it "should be defined" do
#     lambda { rps_game_winner() }.should_not raise_error(::NoMethodError)
#   end

#   # this is given for free in the outline
#   it "should raise WrongNumberOfPlayersError if there are not exactly two players" do
#     lambda { rps_game_winner([ ["Allen", "S"] ]) }.should raise_error(WrongNumberOfPlayersError), "No error raised for incorrect number of players"
#   end
# end

# describe "#rps_tournament_winner" do
#   it "should be defined" do
#     lambda { rps_tournament_winner() }.should_not raise_error(::NoMethodError)
#   end
# end


class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # your code here
  raise NoSuchStrategyError unless (game[0][1] =~ /[rps]/i and game[1][1] =~ /[rps]/i)
  win_pos = {"R"=>{"R"=>0, "P"=>1, "S"=>0}, "P"=>{"R"=>0, "P"=>0, "S"=>1}, "S"=>{"R"=>1, "P"=>0, "S"=>0}}
  return game[win_pos[game[0][1]][game[1][1]]]
end

lst = [ [ "Joel", "P" ], [ "Halima", "S" ] ]
puts rps_game_winner(lst)

def rps_tournament_winner(match)
  if match[0].class.name == String.name
    return match
  else
    w1 = rps_tournament_winner(match[0])
    w2 = rps_tournament_winner(match[1])
    return rps_game_winner([w1, w2])
  end
end
t = [[    [ ["Armando", "P" ], ["Dave", "S"] ],[ ["Richard", "R"],  ["Michael", "S"] ],  ],    [[ ["Allen", "S"], ["Omer", "P"] ],[ ["David E.", "R"], ["Richard X.", "P"] ]]]   
puts rps_tournament_winner(t)




