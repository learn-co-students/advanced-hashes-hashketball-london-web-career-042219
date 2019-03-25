# Write your code here!
require "pry"

def game_hash

  game_hash = {
    home:{ team_name:"Brooklyn Nets",
          colors:["Black", "White"],
          players:{
            "Alan Anderson" => {
              number:0,
              shoe:16,
              points:22,
              rebounds:12,
              assists:12,
              steals:3,
              blocks:1,
              slam_dunks:1
              },
            "Reggie Evans" => {
              number:30,
              shoe:14,
              points:12,
              rebounds:12,
              assists:12,
              steals:12,
              blocks:12,
              slam_dunks:7
              },
             "Brook Lopez" => {
              number:11,
              shoe:17,
              points:17,
              rebounds:19,
              assists:10,
              steals:3,
              blocks:1,
              slam_dunks:15
              },
             "Mason Plumlee" => {
              number:1,
              shoe:19,
              points:26,
              rebounds:12,
              assists:6,
              steals:3,
              blocks:8,
              slam_dunks:5
              },
             "Jason Terry" => {
              number:31,
              shoe:15,
              points:19,
              rebounds:2,
              assists:2,
              steals:4,
              blocks:11,
              slam_dunks:1
              }
          }
    },
    away:{ team_name:"Charlotte Hornets",
          colors:["Turquoise", "Purple"],
          players:{
            "Jeff Adrien" => {
              number:4,
              shoe:18,
              points:10,
              rebounds:1,
              assists:1,
              steals:2,
              blocks:7,
              slam_dunks:2
              },
            "Bismak Biyombo" => {
              number:0,
              shoe:16,
              points:12,
              rebounds:4,
              assists:7,
              steals:7,
              blocks:15,
              slam_dunks:10
              },
             "DeSagna Diop" => {
              number:2,
              shoe:14,
              points:24,
              rebounds:12,
              assists:12,
              steals:4,
              blocks:5,
              slam_dunks:5
              },
             "Ben Gordon" => {
              number:8,
              shoe:15,
              points:33,
              rebounds:3,
              assists:2,
              steals:1,
              blocks:1,
              slam_dunks:0
              },
             "Brendan Haywood" => {
              number:33,
              shoe:15,
              points:6,
              rebounds:12,
              assists:12,
              steals:22,
              blocks:5,
              slam_dunks:12
              }
          }
    }
  }

end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end


def num_points_scored( player)
  result = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
      if attribute==:players
        data.each do |players_name, data_item|
          if players_name==player
            data_item.each do | element, element_result |
              if element==:points
                  result=element_result
              end
            end    
          end
        end
      end
    end
  end
  result
end

def shoe_size( player)
  result = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
      if attribute==:players
        data.each do |players_name, data_item|
          if players_name==player
            data_item.each do | element, element_result |
              if element==:shoe
                  result=element_result
              end
            end    
          end
        end
      end
    end
  end
  result
end


def team_colors( team_name)
  result = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name]== team_name
      team_data.each do |attribute, data|
        if attribute==:colors 
          data.each do |colours|
            result << colours
          end
        end
      end
    end
  end
  result
end

def team_names
  result = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute==:team_name
            result << data
        end
      end
    end
  result
end

def player_numbers( team_name)
  result = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name]== team_name
      team_data.each do |team_attribute, team_data|
        if team_attribute==:players
         team_data.each do | player, player_data |
           player_data.each do | player_attribute, player_att_data|
             if player_attribute==:number
               result << player_att_data
             end
           end
         end
       end
      end
    end
  end
  result
end


def player_stats( player)
  result = {}
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
      if attribute==:players
        data.each do |players_name, data_item|
          if players_name==player
            result=game_hash[location][attribute][players_name]
          end
        end
      end
    end
  end
  result
end

def big_shoe_rebounds
  current_shoe = 0
  result_location=""
  result_team=""
  result_player=""
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
      if attribute==:players
        data.each do |players_name, data_item|

            data_item.each do | element, element_result |
              if element==:shoe
                  if element_result>current_shoe
                      current_shoe=element_result
                      result_location=location
                      result_player=players_name
                  end
              end
            end    

        end
      end
    end
  end

  game_hash[result_location][:players][result_player][:rebounds]

end

def most_points_scored
  current_points = 0
  result_location=""
  result_team=""
  result_player=""
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
      if attribute==:players
        data.each do |players_name, data_item|

            data_item.each do | element, element_result |
              if element==:points
                  if element_result>current_points
                      current_points=element_result
                      result_location=location
                      result_player=players_name
                  end
              end
            end    

        end
      end
    end
  end

  result_player

end


def winning_team
  current_points = 0
  max_points = 0
  max_team = ""
  game_hash.each do |location, team_data|
      current_points=0
      current_team=game_hash[location][:team_name]
      team_data.each do |attribute, data|
       if attribute==:players
         data.each do |players_name, data_item|
            data_item.each do | element, element_result |
              if element==:points
                current_points+=element_result
              end
            end
          end    
        end
      end
      if current_points > max_points
        max_team=current_team
        max_points=current_points
      end

    end
  
  max_team

end

def player_with_longest_name
  max_length = 0
  max_name = ""
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute==:players
          data.each do |players_name, data_item|
              if players_name.length>max_length
                max_name=players_name
                max_length=players_name.length
              end
          end
        end
      end
  end
  max_name
end


def player_with_biggest_steals
  max_steals = 0
  max_name = ""
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute==:players
          data.each do |players_name, data_item|
            data_item.each do | element, element_value |  
              if element==:steals
                if element_value>max_steals
                  max_name=players_name
                  max_steals=element_value
                end
              end        
          end
        end
      end
  end
  end
  max_name
end

def long_name_steals_a_ton? 
  player_with_longest_name==player_with_biggest_steals
end