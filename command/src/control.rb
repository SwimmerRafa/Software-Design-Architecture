# Command Pattern
# Date: 30-Mar-2020
# Authors:
#          A01379896 Erick Bautista Perez
#          A01378916 Rafael Moreno Cañas

# File: control.rb

#General command pattern class that creates the control
class RemoteControlWithUndo
  
  #Initialize the  on-off commands array
  def initialize
    @on_commands = []
    @off_commands = []
    no_command = NoCommand.new
    7.times do
      @on_commands << no_command
      @off_commands << no_command
    end
    @undo_command = no_command
  end
  
  #Function that assign the on-off command to the slot
  def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
  end
  
  #Function thatexecute the "on" command
  def on_button_was_pushed(slot)
    @on_commands[slot].execute
    @undo_command = @on_commands[slot]
  end
  
  #Function thatexecute the "off" command
  def off_button_was_pushed(slot)
    @off_commands[slot].execute
    @undo_command = @off_commands[slot]
  end
  
  #Function that executes the "undo" command 
  def undo_button_was_pushed()
    @undo_command.undo
  end
  
  #Function that crrates the interface of the control
  def inspect
    string_buff = ["\n------ Remote Control -------\n"]
    @on_commands.zip(@off_commands) \
        .each_with_index do |commands, i|
      on_command, off_command = commands
      string_buff << \
      "[slot #{i}] #{on_command.class}  " \
        "#{off_command.class}\n"
    end
    string_buff << "[undo] #{@undo_command.class}\n"
    string_buff.join
  end

end

#Class that represent the empty slots 
class NoCommand
  #Execute the NoCommand
  def execute
    puts "NoCommand"
  end
  
  #Undo the NoCommand
  def undo
    puts "NoCommand"
  end

end

#Class thar represents the manipulation of lights
class Light
  
  #reading attrubute of level
  attr_reader :level
  
  #Initialize the light class
  def initialize(location)
    @location = location
    @level = 0
  end
  
  #Function that turn on the lights
  def on
    @level = 100
    puts "Light is on"
  end
  
  #Function that turn off the lights
  def off
    @level = 0
    puts "Light is off"
  end
  
  #function that verifys the light levels
  def dim(level)
    @level = level
    if level == 0
      off
    else
      puts "Light is dimmed to #{@level}%"
    end
  end

end

#Class that represents the manipulation of ceilingfan
class CeilingFan

  # Access these constants from outside this class as
  # CeilingFan::HIGH, CeilingFan::MEDIUM, and so on.
  # CeilingFan::HIGH
  HIGH   = 3
  # CeilingFan::MEDIUM
  MEDIUM = 2
  # CeilingFan::LOW
  LOW    = 1
  # CeilingFan::OFF
  OFF    = 0
  
  #reading attrubute of speed
  attr_reader :speed
  
  #initialize the ceilingfan class
  def initialize (location)
    @location = location
    @speed = OFF
  end
  
  #Function that set the speed of the fan to High
  def high
    @speed = HIGH
    puts "#{@location} ceiling fan is on high"
  end
  
  #Function that set the speed of the fan to Medium
  def medium
    @speed = MEDIUM
    puts "#{@location} ceiling fan is on medium"
  end
  
  #Function that set the speed of the fan to Low
  def low
    @speed = LOW
    puts "#{@location} ceiling fan is on low"
  end
  
  #Function that turns off the fan
  def off
    @speed = OFF
    puts "#{@location} ceiling fan is off"
  end

end

#Class that specifies to turn on the Light, inheriting from class Light
class LightOnCommand < Light
  #reading attrubute of light
  attr_reader :light
  
  #initialize the class, taking light as parameter
  def initialize(light)
    @light = light
  end
  
  #Function that call the method of light "On"
  def execute
    light.on
  end
  
  #Function that call the method of light "Off"
  def undo
    light.off
  end
  
end

#Class that specifies to turn off the Light, inheriting from class Light
class LightOffCommand < Light
  #reading attrubute of light
  attr_reader :light
  
  #Initialize the class, taking light as parameter
  def initialize(light)
    @light = light
  end
  
  #Function that call the method of light "Off"
  def execute
    light.off
  end
  
  #Function that call the method of light "On"
  def undo
    light.on
  end
end

#Class that specifies to set speed to High of the fan, inheriting from class CeilingFan
class CeilingFanHighCommand < CeilingFan
  #reading attrubute of fan
  attr_reader :fan
  
  #Initialize the class, taking fan as parameter 
  def initialize(fan)
    @fan = fan
  end
  
  #Function that call the method of CeilingFan "High"
  def execute
    fan.high
  end
  
   #Function that call the method of CeilingFan "Medium"
  def undo
    fan.medium
  end
end

#Class that specifies to set speed to Medium of the fan, inheriting from class CeilingFan
class CeilingFanMediumCommand < CeilingFan
  #reading attrubute of fan
  attr_reader :fan
   
  #Initialize the class, taking fan as parameter 
  def initialize(fan)

    @fan = fan
  end
  
   #Function that call the method of CeilingFan "Medium"
  def execute
    fan.medium
  end
  
   #Function that call the method of CeilingFan "Off"
  def undo
    fan.off
  end
end

#Class that specifies to set off the fan, inheriting from class CeilingFan
class CeilingFanOffCommand < CeilingFan
  #reading attrubute of fan
  attr_reader :fan
   
  #Initialize the class, taking fan as parameter 
  def initialize(fan)
    @fan = fan
  end
  
   #Function that call the method of CeilingFan "Off"
  def execute
    fan.off
  end
  
   #Function that call the method of CeilingFan "Medium"
  def undo
    fan.medium
  end
end