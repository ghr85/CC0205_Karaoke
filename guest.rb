# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Guest Class

class Guest
  attr_reader :name_string, :age_int, :wallet_int, :favourite_song, :party_piece
  attr_accessor :tab_int

  def initialize(name_string,age_int, wallet_int,favourite_song,party_piece)
    @name_string = name_string
    @age_int = age_int
    @wallet_int = wallet_int
    @tab_int = 0
    @favourite_song = favourite_song
    @party_piece = party_piece

  end

    def can_afford(product)
     return @wallet_int >= product.price_int + @tab_int
   end
end
