# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Guest Class

class Guest
  attr_reader :name_string, :age_int,:favourite_song, :party_piece
  attr_accessor :tab_int, :wallet_int

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

  def buy_drink(drink,bar)
    if @age_int > 17
      if can_afford(drink)
        @tab_int += drink.price_int
        bar.sell_drink(drink, self)
      else
        return "Sorry you don't have enough"
      end
    else
      return "you're not old enough"
    end
  end

  def request_room(room)
    if can_afford(room)
      room.check_in(self)
    else
      return "Sorry you don't have enough"
    end
  end

  def settle_bill(room)
    @wallet_int -= @tab_int #Had to make wallet attr_accessor? But own class?
  end


end # class end.
