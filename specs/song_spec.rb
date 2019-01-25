# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Drinks - Test Specifications

require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../song.rb')



class TestSong < MiniTest::Test #inherit test functions

  def setup # set up test data
    @song = Song.new('Willaris. K', "Natural Selection")
  end

  def test_has_artist?  #confirm data is accessible
    assert_equal("Willaris. K",@song.artist_string)
  end

  def test_has_title? #confirm data is accessible
    assert_equal("Natural Selection",@song.title_string)
  end

end
