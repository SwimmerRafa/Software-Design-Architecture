#Domain class that have abstract methods for our five literals
class Jankenpon
  #Function that returns the loser
  def -(value)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
  #Function that returns the winner
  def +(value)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
  #Function that returns the object
  def result
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

#Function that prints the result of the expression 
def show(value)
    print ("Result = #{value.result}\n")
end

#Class to implement the Rock object
class RockDSL < Jankenpon
  
  #Function to return the loser of the projection "Rock" with any of the three possible objects
  def -(value)
    if(value == Spock)
      puts "Spock vaporizes Rock (loser Rock)"
      self
    elsif(value == Paper)
      puts "Paper covers Rock (loser Rock)"
      self
    elsif(value == Rock)
      puts "Rock tie (loser Rock)"
      self
    else
      value - self
    end
  end
  
  #Function to return the winner of the projection "Rock" with any of the three possible objects
  def +(value)
    if value == Scissors
      puts "Rock crushes Scissors (winner Rock)"
      self
    elsif(value == Lizard)
      puts "Rock crushes Lizard (winner Rock)"
      self
    elsif(value == Rock)
      puts "Rock tie (winner Rock)"
      self
    else
      value + self
    end
  end
  
  #Function that returns Rock
  def result
    'Rock'
  end
end

#Class to implement the Paper object
class PaperDSL < Jankenpon
  
  #Function to return the loser of the projection "Paper" with any of the three possible objects
  def -(value)
    if(value == Lizard)
      puts "Lizard eats Paper (loser Paper)"
      self
    elsif(value == Scissors)
      puts "Scissors cut Paper (loser Paper)"
      self
    elsif(value == Paper)
      puts "Paper tie (loser Paper)"
      self
    else
      value - self
    end
  end
  
  #Function to return the winner of the projection "Paper" with any of the three possible objects
  def +(value)
    if(value == Spock)
      puts "Paper disproves Spock (winner Paper)"
      self
    elsif(value == Rock)
      puts "Paper covers Rock (winner Paper)"
      self
    elsif(value == Paper)
      puts "Paper tie (winner Paper)"
      self
    else
      value + self
    end
  end
  
  #Function that returns Paper
  def result
    'Paper'
  end
  
end

#Class to implement the Scissors object
class ScissorsDSL < Jankenpon
  
  #Function to return the loser of the projection "Scissord" with any of the three possible objects
  def -(value)
    if(value == Rock)
      puts "Rock crushes Scissors (loser Scissors)"
      self
    elsif(value == Spock)
      puts "Spock smashes Scissors (loser Scissors)"
      self
    elsif(value == Scissors)
      puts "Scissors tie (loser Scissors)"
      self
    else
      value - self
    end
  end
  
   #Function to return the winner of the projection "Scissors" with any of the three possible objects
  def +(value)
    if(value == Lizard)
      puts "Scissors decapitate Lizard (winner Scissors)"
      self
    elsif(value == Paper)
      puts "Scissors cut Paper (winner Scissors)"
      self
    elsif(value == Scissors)
      puts "Scissors tie (winner Scissors)"
      self
    else
      value + self
    end
  end
  
  #Function that returns Scissors
  def result
    'Scissors'
  end
end

#Class to implement the Lizzard object
class LizardDSL < Jankenpon
  
  #Function to return the loser of the projection "Lizzard" with any of the three possible objects
  def -(value)
    if(value == Scissors)
      puts "Scissors decapitate Lizard (loser Lizard)"
      self
    elsif(value == Rock)
      puts "Rock crushes Lizard (loser Lizard)"
      self
    elsif(value == Lizard)
      puts "Lizard tie (loser Lizard)"
      self
    else
      value - self
    end
  end
  
  #Function to return the winner of the projection "Lizzard" with any of the three possible objects
  def +(value)
    if(value == Spock)
      puts "Lizard poisons Spock (winner Lizard)"
      self
    elsif(value == Paper)
      puts "Lizard eats Paper (winner Lizard)"
      self
    elsif(value == Lizard)
      puts  "Lizard tie (winner Lizard)"
      self
    else
      value + self
    end
  end
  
  #Function that returns Lizzard
  def result
    'Lizard'
  end
end

#Class to implement the Spock object
class SpockDSL < Jankenpon
  
  #Function to return the loser of the projection "Spock" with any of the three possible objects
  def -(value)
    if(value == Lizard)
      puts  "Lizard poisons Spock (loser Spock)"
      self
    elsif(value == Paper)
      puts  "Paper disproves Spock (loser Spock)"
      self
    elsif(value == Spock)
      puts  "Spock tie (loser Spock)"
      self
    else
      value - self
    end
  end
  
  #Function to return the winner of the projection "Spock" with any of the four possible objects
  def +(value)
    if(value == Scissors)
      puts "Spock smashes Scissors (winner Spock)"
      self
    elsif(value == Rock)
      puts "Spock vaporizes Rock (winner Spock)"
      self
    elsif(value == Spock)
      puts  "Spock tie (winner Spock)"
      self
    else
      value + self
    end
  end
  
  #Function that returns Spock
  def result
    'Spock'
  end
end


#Initialize Rock instance
Rock = RockDSL.new

#Initialize Lizzard instance
Lizard = LizardDSL.new

#Initialize Scissors instance
Scissors = ScissorsDSL.new

#Initialize Paper instance
Paper = PaperDSL.new

#Initialize Spock instance
Spock = SpockDSL.new
