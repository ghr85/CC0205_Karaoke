# Codeclan Week 02 Day 05 Homework
# Codeclan Karaoke
# Drinks - Test Specifications

require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../drink.rb')



class TestDrink < MiniTest::Test #inherit test functions

  def setup # set up test data
    @drink = Drink.new('Beer', 3) #create test object
  end

  def test_has_name? #confirm data is accessible
    assert_equal("Beer",@drink.name_string)
  end

  def test_has_price? #confirm data is accessible
    assert_equal(3,@drink.price_int)
  end
end
