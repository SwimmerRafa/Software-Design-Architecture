# Decorator Pattern
# Date: 20-Apr-2020
# Authors:
#          A01378916 Rafael Moreno Cañas
#          A01379896 Erick Bautista Perez

# File: coffee.rb

#Abstract class of Beverage that have the methods to make a inheritance.
class Beverage
   #Initializes the description with a raise exception.
   def description
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
   end
   
   #Initializes the cost with a raise exception.
   def cost
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
   end
end

#Type of class inheritance Beverage that have the same methods to make a DarkRoast coffee.
class DarkRoast < Beverage
  #Initializes the variable description and cost with empty values 
  def initialize
    @description = ""
    @cost = 0.0
  end
  #Assign the description with a value of Dark Roast Coffee
  def description
    @description = "Dark Roast Coffee"
  end
  #Assign the cost of the beverage  
  def cost
    @cost = 0.99
  end
end

#Type of class inheritance Beverage that have the same methods to make a Espresso coffee.
class Espresso < Beverage
  #Initializes the variable description and cost with empty values
  def initialize
    @description = ""
    @cost = 0.0
  end
  #Assign the description with a value of Espresso
  def description
    @description = "Espresso"
  end
  #Assign the cost of the beverage
  def cost
    @cost = 1.99
  end
end

#Type of class inheritance Beverage that have the same methods to make a HouseBlend coffee.
class HouseBlend < Beverage
  #Initializes the variable description and cost with empty values
  def initialize
    @description = ""
    @cost = 0.0
  end
  #Assign the description with a value of House Blend Coffee
  def description
    @description = "House Blend Coffee"
  end
  #Assign the cost of the beverage
  def cost
    @cost = 0.89
  end
end

#Decorator class that have an inheritance with the Beverage class and it is used with condiments.
class CondimentDecorator < Beverage
  #Attribute of type beverage that it is used to make a reference with the object
  attr_accessor :beverage
  #Initialize and assign the type of beverage
  def initialize(beverage)
    @beverage = beverage
  end
  #Assign the description with a value of the type of beverage
  def description
    @beverage.description
  end
  #Assign the cost of the type of beverage  
  def cost
    @beverage.cost
  end
end

#Mocha CondimentDecorator
class Mocha < CondimentDecorator
  #Initialize and assign the type of beverage
  def initialize(beverage)
    @beverage = beverage
  end
  #Add the description of the type of beverage with the condiment 
  def description
    @beverage.description + ", Mocha"
  end
  #Add the cost of the beverage with the condiment
  def cost
    @beverage.cost + 0.20
  end
end 

#Whip CondimentDecorator
class Whip < CondimentDecorator
  #Initialize and assign the type of beverage
  def initialize(beverage)
    @beverage = beverage
  end
  #Add the description of the type of beverage with the condiment 
  def description
    @beverage.description + ", Whip"
  end
  #Add the cost of the beverage with the condiment
  def cost
    @beverage.cost + 0.10
  end
end

#Soy CondimentDecorator
class Soy < CondimentDecorator
  #Initialize and assign the type of beverage
  def initialize(beverage)
    @beverage = beverage
  end
  #Add the description of the type of beverage with the condiment 
  def description
    @beverage.description + ", Soy"
  end
  #Add the cost of the beverage with the condiment
  def cost
    @beverage.cost + 0.15
  end
end

#Milk CondimentDecorator
class Milk < CondimentDecorator
  #Initialize and assign the type of beverage
  def initialize(beverage)
    @beverage = beverage
  end
  #Add the description of the type of beverage with the condiment 
  def description
    @beverage.description + ", Milk"
  end
  #Add the cost of the beverage with the condiment
  def cost
    @beverage.cost + 0.10
  end
end