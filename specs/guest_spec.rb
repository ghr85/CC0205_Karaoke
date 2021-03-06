# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Guest - Test Specifications

require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../drink.rb')
require_relative('../bar.rb')

class TestGuest<MiniTest::Test

  def setup
    @song = Song.new('Willaris. K', "Natural Selection")
    @drink = Drink.new('Beer', 3)
    @room = Room.new("The Excelsior Suite",6, 8,[@song])
    @guest_1 = Guest.new("Max Cooper",33,30,@song,"Ooft ya dancer!")
    @guest_2 = Guest.new("Johnny Scrounger",33,2,@song,"*radiates fluorescent pong*")
    @guest_3 = Guest.new("Young Gunn",17,30,@song,"*radiates fluorescent pong*")
    @bar = Bar.new("The House of Shattered Windows", [@drink],[@room])
  end

  def test_has_name
    assert_equal("Max Cooper",@guest_1.name_string)
  end

  def test_has_age
    assert_equal(33,@guest_1.age_int)
  end

  def test_has_wallet
    assert_equal(30,@guest_1.wallet_int)
  end

  def test_has_tab
    assert_equal(0,@guest_1.tab_int)
  end

  def test_has_fav_song
    assert_equal(@song,@guest_1.favourite_song)
  end

  def test_has_party_piece
    assert_equal("Ooft ya dancer!",@guest_1.party_piece)
  end

  def test_affordability_true
    assert_equal(true, @guest_1.can_afford(@room))
  end

  def test_affordability_false #double edged - tests that drink works too
    assert_equal(false, @guest_2.can_afford(@drink))
  end

  def test_can_buy_drink__positive
    assert_equal("That'll be £3, thanks Max Cooper", @guest_1.buy_drink(@drink,@bar))
  end

  def test_can_buy_drink__positive_tab
    @guest_1.buy_drink(@drink,@bar)
    assert_equal(3, @guest_1.tab_int)
  end

  def test_can_buy_drink__negative__money
    assert_equal("Sorry you don't have enough", @guest_2.buy_drink(@drink,@bar))
  end

  def test_can_buy_drink__negative__age
    assert_equal("you're not old enough", @guest_3.buy_drink(@drink,@bar))
  end

  def test_request_room

    @guest_1.request_room(@room) #request a room (could be one of many)
    assert_equal(@room.find_guest(@guest_1), "Max Cooper is checked in to The Excelsior Suite.")
  end

  def test__settle_bill
    @guest_1.request_room(@room)
    @guest_1.buy_drink(@drink,@bar)
    @guest_1.buy_drink(@drink,@bar)
    # binding.pry
    @guest_1.settle_bill(@room)
    assert_equal(18, @guest_1.wallet_int)
  end


end #class end
