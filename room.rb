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

  def add_song_to_room(song)#add song object to playlist array
    @playlist_arr << song
  end

  def find_guest(guest)#check if a guest is checked in
    if @guest_arr.find{|guest_element| guest_element == guest } == guest
      return "#{guest.name_string} is checked in to #{@name_string}."
    else
      return "#{guest.name_string} is not checked in."
    end
  end

  def check_in(guest) #check in guest - tricky responsibilities.
    if @capacity_int > 0 #check capacity before checking in
      guest.tab_int += @price_int # add it to the tab to be paid on check-out
      @guest_arr << guest #put the guest in the room array
      @capacity_int -= 1 #drop capacity
      if @playlist_arr.find{|song_element| song_element == guest.favourite_song} == guest.favourite_song
        return guest.party_piece #Return the "that's my song" trick.
      else
        return "This place is so mainstream."#This gives you a negative return value to test for
      end
    else
      return "We're sorry #{guest.name_string} but this room is full, please try checking into another room."
    end
  end

  def check_out(guest)
    guest.settle_bill(self) #call on the guess to settle their bill and ACCESS THEIR OWN WALLET
    @guest_arr.delete(guest) #get rid of guest
    @capacity_int += 1 #increase capacity
  end

end #This is class end, stop stealing it.
