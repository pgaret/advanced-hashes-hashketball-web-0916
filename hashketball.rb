# Write your code here!
require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => "Black, White",
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe =>16,
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
          :slam_dunks=> 5
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
      :colors => "Turquoise, Purple",
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

def num_points_scored(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  size = 0
  game_hash.each do |x, y|
    if y[:players].include?(player)
      size = y[:players][player][:shoe]
    end
  end
  size
end

def team_colors(team)
  str = ""
  game_hash.each do |x, y|
    if y[:team_name] == team
      str << y[:colors]
    end
  end
  str.split(", ")
end

def team_names
  game_hash.collect do |x, y|
    y[:team_name]
  end
end

def player_numbers(team)
  arr = []
  game_hash.each do |x, y|
    y[:players].each do |z, a|
      if y[:team_name] == team
        arr << a[:number]
      end
    end
  end
  arr
end

def player_stats(player)
  pl = Hash.new
  game_hash.each do |x, y|
    y[:players].each do |z, a|
      if z == player
        pl = a
      end
    end
  end
  pl
end

def big_shoe_rebounds
  rebounds = 0
  max_shoe = 0
  game_hash.each do |x, y|
    y[:players].each do |z, a|
      if a[:shoe] > max_shoe
        max_shoe = a[:shoe]
        rebounds = a[:rebounds]
      end
    end
  end
  rebounds
end


#def good_practices
#  game_hash.each do |location, team_data|
#    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#    binding.pry
#      team_data.each do |attribute, data|
#        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#        binding.pry
#
#        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end
player_numbers("Brooklyn Nets")
