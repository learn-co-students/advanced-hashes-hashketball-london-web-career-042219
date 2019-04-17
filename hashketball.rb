# Write your code here!



def game_hash
  game_hash =
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }
    }
  }


}

end

  def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stat|
      if name == player_name
        return player_stat[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stat|
      if name == player_name
       return player_stat[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_name == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []

  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end

  teams
end

def player_numbers(team_name)
  jersey_numbers = []

  game_hash.each do |location, team_data|
    if team_name == team_data[:team_name]
      team_data[:players].each do |player_name, player_stats|
        jersey_numbers << player_stats[:number]
      end
    end
  end

  return jersey_numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds()
  player_with_largest_shoe = find_player_with_longest_shoe()

  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name == player_with_largest_shoe
        return player_stats[:rebounds]
      end
    end
  end
end

def find_player_with_longest_shoe
  largest_shoe_size = nil
  player_with_largest_shoe = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if largest_shoe_size == nil || player_stats[:shoe] > largest_shoe_size
        largest_shoe_size = player_stats[:shoe]
        player_with_largest_shoe = player_name
     end
    end
  end

  player_with_largest_shoe
end

big_shoe_rebounds
