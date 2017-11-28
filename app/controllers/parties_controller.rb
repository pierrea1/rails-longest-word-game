require 'open-uri'
require 'json'

class PartiesController < ApplicationController

GRID_ARRAY = [*('A'..'Z')].sample(9)

  def game
      @grid_array = GRID_ARRAY
      @start_time = Time.now
  end

  def score

    @answer = params[:answer]

# ***** Check that the word is included in the grid *****

    guess_array = @answer.split("")
    grid_array = GRID_ARRAY
    included?(guess_array)

# ***** Score calculation & Message generator *****
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)

    if (user["found"] == true) && (user["length"] == 1)
      @score = user["length"]
      # /result[:time]
      @message = "Well Done"
    else
      @score = 0
      @message = "You are bad"
    end

# **** Time calculator *****

    @timeframe = Time.now.to_i - @start_time.to_i

  end

def included?(guess)

  hash_count_attempt = Hash.new 0
  hash_count_grid = Hash.new 0

  # guess = ["h", "e", "l", "l", "o"]
  guess.each do |letter|
    hash_count_attempt[letter] = hash_count_attempt[letter] + 1
  end

  GRID_ARRAY.each do |letter|
    hash_count_grid[letter] = hash_count_grid[letter] + 1
  end

  raise

  hash_count_attempt.keys.each do |key|
    if hash_count_attempt[key] > hash_count_grid[key]
      return false
    else
      return true
    end
  end


  # guess.all? { |letter| guess.count(letter) <= GRID_ARRAY.count(letter) }
end


def check

# ***** Check that the word is included in the grid *****


array_attempt = @answer.split(//)

hash_count_attempt = Hash.new 0
hash_count_grid = Hash.new 0
variable = 1

# create two hashes for attempt and grid with keys = all the letters and values = number of occurences
array_attempt.each do |letter|
  hash_count_attempt[letter] = hash_count_attempt[letter] + 1
end

@array_of_letters.each do |letter|
  hash_count_grid[letter] = hash_count_grid[letter] + 1
end

#check if the value for each key in the attempt hash is not bigger than value in the grid hash
#when the key loop finds a higher value for a letter, it returns a false message and break

#sum will be equal to 1, otherwise 0

hash_count_attempt.keys.each do |key|
  if hash_count_attempt[key] > hash_count_grid[key]
    variable = 0
  end
end

end

end
