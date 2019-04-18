def game_hash
  {
    home: {
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
    away: {
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
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
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
        }
      }
    }
  }
end
 


def num_points_scored(names)

point_information = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data_item|
      	  if player == names
      	    data_item.each do |key, value|
      		    if key == :points 
      		      point_information = value
      		    end
      		  end
      	  end
        end
      end
    end
  end 
point_information
end


def shoe_size(player_name)
  game_hash.each do |team, players|
    players[:players].each do |name, info|
      if name == player_name
        return info[:shoe]
      end
    end
  end
end


def team_colors(team_name)
  colors = nil
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      colors = team_data[:colors]
    end
  end
  colors
end


def team_names
  names = []                                                 #as question asked for an array assign an empty array
  game_hash.each do |location, team_data|                    #iterate through the first set of hash
    names << team_data[:team_name]                           #push desired value into empty array
  end                                                        
  names                                                      #ruby returns the last thing we call in the method
end


def player_numbers(team_name)
  jersey_nums = []                                            #assign an empty array for numbers
  game_hash.each do |location, team_data|                     #begin iteratng over the first layer
    team_data[:players].each do |player, data|                #grab placeholder and iterate in desired hash
      if team_data[:team_name] == team_name                   #after iteratng in the desired hash you can then call 
                                                              #your first condition (if)
        jersey_nums << team_data[:players][player][:number]   #push desired information 
      end
    end
  end
  jersey_nums
end



def player_stats(player_name)                                  
  game_hash.each do |location, team_data|                      #begin iteratng over the first layer
    stats = team_data[:players][player_name]                   #looking for player stats, assign local variable
    if stats                                                   #called and if statment but didn't work for comparison
      return stats                                             #return value
    end
  end
end


def big_shoe_rebounds
biggest_shoe = 0                                              #Q. first asks for biggest_shoe then player[:rebounds]
select_player = nil                                           #best to set variables for relevant of data
  game_hash.each do |team, team_data|                         #iterate through team and team_data
    team_data[:players].each do |player, data|                #then iterate through player and their data
      if data[:shoe] > biggest_shoe                           #compare relevant information during iteration process
        biggest_shoe = data[:shoe]                            #now store information to variable set
        select_player = data                                  #ruby will update information through process 
      end
    end
  end
  select_player[:rebounds]                                    #now select_player has been updated we can call for the
end                                                           #data (rebounds in this case) using our variable

def most_points_scored                                        
  high_score = 0                                              #Q. first asks for person then HIGHEST player[:points]
  select_player = nil                                         #best to set variables for relevant of data
  game_hash.each do |team, team_data|                         #iterate through team and team_data
    team_data[:players].each do |player, data|                #then iterate through player and their data
      if data[:points] > high_score                           #compare relevant information during iteration process
        high_score = data[:points]                            #now store information to variable set
        select_player = player                                #ruby will update information through process 
      end
    end
  end
  select_player                                               #call for variable containing player with the m_points
end


def winning_team
  a_points = 0
  b_points = 0
    game_hash.each do |team, team_data|
      team_data[:players].each do |player, data|
        if team == :home
          a_points += data[:points]
        else
          b_points += data[:points]
        end
      end
    end
    if a_points > b_points
      game_hash[:home][:team_name]
    else
      game_hash[:away][:team_name]
    end
end

def player_with_longest_name
  longest_name = 0
  player_name = nil
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      if player.to_s.length > longest_name
        player_name = player 
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  longest_name = 0
  player_long_name = nil
  player_steals = 0
  player_steals_name = nil
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      if player.to_s.length > longest_name
        player_name = player
      end
        if data[:steals] > player_steals
          player_steals_name = player
        end
        if player_steals_name = player_name
          return true
        else
          false
        end
    end
  end
end
      

        