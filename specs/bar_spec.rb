# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Bar - Test Specifications

require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../drink.rb')
require_relative('../bar.rb')

class TestBar < MiniTest::Test

  def setup
    @song = Song.new('Willaris. K', "Natural Selection")
    @drink = Drink.new('Beer', 3)
    @room = Room.new("The Excelsior Suite",6, 8,[@song])
    @guest_1 = Guest.new("Max Cooper",33,30,@song,"Ooft ya dancer!")
    @guest_2 = Guest.new("Johnny Scrounger",33,2,@song,"*radiates fluorescent pong*")
    @bar = Bar.new("The House of Shattered Windows", [@drink],[@room])

  end

  def test_has_name
    assert_equal("The House of Shattered Windows",@bar.name_string)
  end

  def test_has_drinks
    assert_equal([@drink],@bar.drink_arr)
  end

  def test_has_rooms
    assert_equal([@room],@bar.room_arr)
  end

  def test_sell_drink
    @room.check_in(@guest_1)
    assert_equal("That'll be £3, thanks Max Cooper", @bar.sell_drink(@drink, @guest_1))
  end

end # class end - don't touch
