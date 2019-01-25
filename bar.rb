# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Bar Class

#require ('pry') <- make this a habit

class Bar


  attr_reader :name_string, :drink_arr
  attr_accessor :room_arr


  def initialize(name_string, drink_arr,room_arr)
    @name_string = name_string
    @drink_arr = drink_arr
    @room_arr = room_arr
  end

end #This is class end - leave it alone.
