require 'pry'

def game_hash
  {
  home:
    {team_name: "Brooklyn Nets", \
     colors: "Black, White", \
     players:
       {"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},\
         "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}, \
         "Brook Lopez" => {number: 11 , shoe: 17 , points: 17 , rebounds: 19 , assists: 10 , steals: 3, blocks: 1 , slam_dunks: 15}, \
         "Mason Plumlee" => {number: 1 , shoe: 19 , points: 26 , rebounds: 12 , assists: 6 , steals: 3, blocks: 8 , slam_dunks: 5 }, \
         "Jason Terry" => {number: 31 , shoe: 15, points: 19 , rebounds: 2 , assists: 2 , steals: 4, blocks: 11 , slam_dunks: 1}\
         }\
     },\

     away:
      {team_name: "Charlotte Hornets", \
       colors: "Turquoise, Purple", \
       players:
         {"Jeff Adrien" => {number: 4, shoe:18 , points:10 , rebounds: 1 , assists: 1, steals: 2, blocks: 7, slam_dunks: 2}, \
          "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},\
          "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},\
          "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},\
          "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}\
         }\
      }\
    }
end

def num_points_scored(player)
  score = 99
  game_hash.each {|location, team_data|
    if game_hash[location][:players].include?(player)
      score = game_hash[location][:players][player][:points]
    end
    }
    score
end

def shoe_size(player)
  size = 99
  game_hash.each {|location, team_data|
    if game_hash[location][:players].include?(player)
      size = game_hash[location][:players][player][:shoe]
    end
    }
    size
end

def team_colors(name)
  colors = []
  game_hash.each {|location, team_data|
    if game_hash[location][:team_name] == name
      colors = game_hash[location][:colors].split(', ')
    end
    }
    colors
end

def team_names
  names = []
  game_hash.each {|location, team_data|
    names << game_hash[location][:team_name]

  }
  names
end

def player_numbers(name)
  numbers = []

  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players && game_hash[location][:team_name] == name
        data.each { |name, hash|
          numbers << game_hash[location][attribute][name][:number]
        }
      end
    }
  }
  numbers
end

def player_stats(name)
  stats = {}

  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players
        data.each { |player, hash|
          if player == name
            stats = hash
          end
        }
      end
    }
  }
stats
end

def big_shoe_rebounds
  largest = 0
  rebounds = 0
  size = 0

  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players
        data.each { |player, hash|
         size = game_hash[location][attribute][player][:shoe]
           if size > largest
             largest = size
             rebounds = game_hash[location][attribute][player][:rebounds]
           end
        }
      end
    }
  }
  rebounds
end

def most_points_scored
  #The number of points scored method return an integer if given a name
  #iterate over an array of player names (.keys) passing tthem to num_points_scored
  #use .each_with_index to store the index of the highest scorer
end



def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      #  binding.pry
        if data.class == Hash

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
          data.each do |data_item|
          #  binding.pry
          end
        end
    end
  end
end

#good_practices
