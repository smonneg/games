module GameServices
  class Populate
    def self.call
      mapper = GamesMapper.new

      [:ios, :android].each do |platform|
        mapper.(GetTopHundredGames.call(platform)).each do |game|
          Game.create(game)
        end
      end
    end
  end
end
