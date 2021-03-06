# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Room - Test Specifications

require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../guest.rb')
require_relative ('../song.rb')
require_relative ('../room.rb')
require_relative ('../drink.rb')
require_relative ('../bar.rb')


class TestRoom < MiniTest::Test #inherit test functions

  def setup # set up test data
    @song_1 = Song.new('Willaris. K', "Natural Selection")#create test objects
    @song_2 = Song.new('Willaris. K', "Natural Selection")
    @guest_1 = Guest.new("Max Cooper",33,100,@song_1,"*gets on the floor and does the worm*")
    @guest_2 = Guest.new("Stephan Bodzin",40,30,@song_2,"Ooft ya dancer!")
    @room = Room.new("The Excelsior Suite",6, 8,[@song_1])
    @bar = Bar.new("The House of Shattered Windows", [@drink],[@room])
    @drink = Drink.new('Beer', 3)
  end

  def test_has_name? #confirm data is accessible
    assert_equal("The Excelsior Suite",@room.name_string)
  end

  def test_has_capacity? #confirm data is accessible
    assert_equal(8,@room.capacity_int)
  end

  def test_has_playlist? #confirm data is accessible
    assert_equal([@song_1], @room.playlist_arr)
  end

  def test_has_guest_ary? #confirm data is accessible
    assert_equal([],@room.guest_arr )
  end

  def test_has_price?
    assert_equal(6,@room.price_int)
  end

  def test_add_song_to_room
    @room.add_song_to_room(@song_2)
    assert_equal([@song_1,@song_2],@room.playlist_arr)
  end

  def test_find_guest
    @room.check_in(@guest_1)
    assert_equal("Max Cooper is checked in to The Excelsior Suite.", @room.find_guest(@guest_1))
  end

  def test_find_get_negative
    assert_equal("Stephan Bodzin is not checked in.", @room.find_guest(@guest_2))
  end

  def test_add_guest_to_room # watch out for nils sneaking through
    @room.check_in(@guest_1)
    assert_equal([@guest_1],@room.guest_arr)
  end

  def test_add_guest_to_room__add_to_tab
    @room.check_in(@guest_1)
    assert_equal(6,@guest_1.tab_int)
  end

  def test_remove_guest_from_room
    @room.check_in(@guest_2) #confirm other guests are in tact
    @room.check_in(@guest_1)
    @room.check_out(@guest_2)
    assert_equal("Stephan Bodzin is not checked in.", @room.find_guest(@guest_2))
    assert_equal("Max Cooper is checked in to The Excelsior Suite.", @room.find_guest(@guest_1)) #Double test just to make sure function is targetting specific guest
  end

  def test_remove_pay_tab
    @room.check_in(@guest_1)
    @guest_1.buy_drink(@drink,@bar)
    @guest_1.buy_drink(@drink,@bar)
    @room.check_out(@guest_1)
    assert_equal(88, @guest_1.wallet_int)
  end

  def test_check_in_increase_capacity
    @room.check_in(@guest_1)
    assert_equal(7,@room.capacity_int)
  end

  def test_check_in_decrease_capacity
    @room.check_in(@guest_1)#use the same guest
    @room.check_in(@guest_1)#double edged check that this
    @room.check_out(@guest_1)#doesn't delete 2 guests with same name
    assert_equal(7,@room.capacity_int)
  end

  def test_check_in_party_piece__positive
    assert_equal("*gets on the floor and does the worm*", @room.check_in(@guest_1))
  end

  def test_check_in_party_piece__negative
    assert_equal("This place is so mainstream.", @room.check_in(@guest_2))
  end

  def test_add_guest_to_room__room_full
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    @room.check_in(@guest_1)
    assert_equal("We're sorry Max Cooper but this room is full, please try checking into another room.", @room.check_in(@guest_1))
  end



end #This is class end, stop stealing it.
