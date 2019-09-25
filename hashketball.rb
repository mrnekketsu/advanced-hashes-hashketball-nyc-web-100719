# Write your code here!
require "pry"

def game_hash
  hash = {
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
          :rebounds => 11,
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
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
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
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, value|
      if value.include?(player_name)
        return hash[location][attribute][player_name][:points]
      end
    end
  end
end

def shoe_size(player_name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, value|
      if value.include?(player_name)
        return hash[location][attribute][player_name][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, value|
      if value == team_name
        return hash[location][:colors]
      end
    end
  end
end

def team_names
  hash = game_hash
  teams = []
  hash.each do |location, info|
    info.each do |attribute, value|
      if attribute == :team_name
        teams.push(value)
      end
    end
  end
  teams
end

def player_numbers(team_name)
  hash = game_hash
  numbers = []
  
  hash.each do |location, info|
    if hash[location][:team_name] == team_name
      hash[location][:players].each do |players, details|
        numbers.push(details[:number])
      end
    end
  end
  numbers
end

def player_stats(player_name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, value|
      if value.include?(player_name)
        return hash[location][attribute][player_name]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  shoehash = {}
  largest = 0
  player_name = ""
  hash.each do |location, info|
    hash[location][:players].each do |player, stats|
      stats.each do |key, value|
        if key == :shoe
          shoehash[player] = value
        end
      end
    end
  end
  
  shoehash.each do |name, size|
    if size > largest
      largest = size
    end
  end
  player_name = shoehash.key(largest).to_s
  
  hash.each do |location, info|
    hash[location][:players].each do |player,stats|
      if player == player_name
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  hash = game_hash
  points_hash = {}
  largest = 0
  player_name = ""
  hash.each do |location, info|
    hash[location][:players].each do |player, stats|
      stats.each do |key, value|
        if key == :points
          points_hash[player] = value
        end
      end
    end
  end
  
  points_hash.each do |name, points|
    if points > largest
      largest = points
    end
  end
  player_name = points_hash.key(largest).to_s
  
  hash.each do |location, info|
    hash[location][:players].each do |player,stats|
      if player == player_name
        return player_name
      end
    end
  end
end

def winning_team
  hash = game_hash
  winners = ""
  home_total = 0
  away_total = 0
  hash.each do |location, info|
    hash[location][:players].each do |player, stats|
      stats.each do |key, value|
        if location == :home 
          home_total += value
        else
          away_total += value
        end
      end
    end
  end
  if home_total > away_total
    return hash[:home][:team_name]
  else
    return hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_pl = ""
  hash = game_hash
  hash.each do |location, info|
    hash[location][:players].each do |player, stats|
      if player.length > longest_name_pl.length
        longest_name_pl = player
      end
    end
  end
  longest_name_pl
end

def long_name_steals_a_ton?
  longest_name_pl = player_with_longest_name
  most_steals = 0
  hash = game_hash
  steals_hash = {}
  
  hash.each do |location, info|
    hash[location][:players].each do |player, stats|
      stats.each do |key, value|
        if key == :steals
          steals_hash[player] = value
        end
      end
    end
  end
  
  steals_hash.each do |name, steals|
    if steals_hash[longest_name_pl] < steals_hash[name]
      return false
    else
      return true
    end
  end
end


