# Decorator Pattern
# Date: 20-Apr-2020
# Authors:
#          A01378916 Rafael Moreno Cañas
#          A01379896 Erick Bautista Perez
# File: coffee_test.rb

require 'minitest/autorun'
require 'coffee'

#unit class for the coffee test. 
class CoffeeTest < Minitest::Test

  #Method that test the Espresso class.
  def test_espresso
    beverage = Espresso.new
    assert_equal("Espresso", beverage.description)
    assert_equal(1.99, beverage.cost)
  end

  #Method that test the DarkRoast class and some condiments with decorator pattern.
  def test_dark_roast
    beverage = DarkRoast.new
    beverage = Milk.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("Dark Roast Coffee, Milk, Mocha, Mocha, Whip",
                beverage.description)
    assert_equal(1.59, beverage.cost)
  end

  #Method that test the HouseBlend class and some condiments with decorator pattern.
  def test_house_blend
    beverage = HouseBlend.new
    beverage = Soy.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("House Blend Coffee, Soy, Mocha, Whip",
                beverage.description)
    assert_equal(1.34, beverage.cost)
  end

end