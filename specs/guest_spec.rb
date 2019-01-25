# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Guest - Test Specifications

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../drink.rb')

class TestGuest<MiniTest::Test

  def setup
    @song = Song.new('Willaris. K', "Natural Selection")
    @drink = Drink.new('Beer', 3)
    @room = Room.new("The Excelsior Suite",6, 8,[@song])
    @guest_1 = Guest.new("Max Cooper",33,30,@song,"Ooft ya dancer!")
    @guest_2 = Guest.new("Johnny Scrounger",33,2,@song,"*radiates fluorescent pong*")
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


end
