# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Room Class

#require ('pry') <- make this a habit
class Room

  attr_reader :name_string, :price_int,:capacity_int, :playlist_arr, :guest_arr
  attr_accessor :guest_arr #guest array needs to be editable by bar class

  def initialize(name_string, price_int, capacity_int, playlist_arr)
    @name_string = name_string
    @price_int = price_int
    @capacity_int = capacity_int
    @playlist_arr = playlist_arr
    @guest_arr = []
  end

  def add_song_to_room(song)
    @playlist_arr << song
  end

  def find_guest(guest)
    if @guest_arr.find{|guest_element| guest_element == guest } == guest
      return "#{guest.name_string} is checked in to #{@name_string}."
    else
      return "#{guest.name_string} is not checked in."
    end
  end

  def check_in(guest)
    if @capacity_int > 0
      guest.tab_int += @price_int
      @guest_arr << guest
      @capacity_int -= 1
    else
      return "We're sorry #{guest.name_string} but this room is full, please try checking into another room."
    end
  end

  def check_out(guest)
    @guest_arr.delete(guest)
    @capacity_int += 1
  end

end #This is class end, stop stealing it.
