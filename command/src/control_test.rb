# Command Pattern
# Date: 30-Mar-2020
# Authors:
#          A01379896 Erick Bautista Perez
#          A01378916 Rafael Moreno Cañas

# File: control_test.rb

# The source code contained in this file demonstrates how to
# implement the <em>command pattern</em>.
require 'minitest/autorun'
require 'stringio'
require 'control'

#unit class for the control class.
class ControlTest < Minitest::Test
  
  #Method that setup variables for every print out
  def setup
    set_stdout
    @rc = RemoteControlWithUndo.new
    set_light
    set_fan
  end
  
   #Method that teardown variables for every print out
  def teardown
    reset_stdout
  end
  
  #Method that format the output
  def set_stdout
    @out = StringIO.new
    @old_stdout = $stdout
    $stdout = @out
  end
  
  #Method that reset the output
  def reset_stdout
    $stdout = @old_stdout
  end
  
  #Method that assigns all variables for light test
  def set_light
    light = Light.new("Living Room")
    light_on = LightOnCommand.new(light)
    light_off = LightOffCommand.new(light)
    @rc.set_command(0, light_on, light_off)
  end

  #Method that assigns all variables for CeilingFan test
  def set_fan
    fan = CeilingFan.new("Living Room")
    fan_medium = CeilingFanMediumCommand.new(fan)
    fan_high = CeilingFanHighCommand.new(fan)
    fan_off = CeilingFanOffCommand.new(fan)
    @rc.set_command(1, fan_medium, fan_off)
    @rc.set_command(2, fan_high, fan_off)
  end
  
  #Method that test the Light class
  def test_light
    @rc.on_button_was_pushed(0)
    @rc.off_button_was_pushed(0)
    p @rc
    @rc.undo_button_was_pushed
    @rc.off_button_was_pushed(0)
    @rc.on_button_was_pushed(0)
    p @rc
    @rc.undo_button_was_pushed
    assert_equal                                                \
      "Light is on\n"                                           \
      "Light is off\n"                                          \
      "\n------ Remote Control -------\n"                       \
      "[slot 0] LightOnCommand  LightOffCommand\n"              \
      "[slot 1] CeilingFanMediumCommand  CeilingFanOffCommand\n"\
      "[slot 2] CeilingFanHighCommand  CeilingFanOffCommand\n"  \
      "[slot 3] NoCommand  NoCommand\n"                         \
      "[slot 4] NoCommand  NoCommand\n"                         \
      "[slot 5] NoCommand  NoCommand\n"                         \
      "[slot 6] NoCommand  NoCommand\n"                         \
      "[undo] LightOffCommand\n\n"                              \
      "Light is on\n"                                           \
      "Light is off\n"                                          \
      "Light is on\n"                                           \
      "\n------ Remote Control -------\n"                       \
      "[slot 0] LightOnCommand  LightOffCommand\n"              \
      "[slot 1] CeilingFanMediumCommand  CeilingFanOffCommand\n"\
      "[slot 2] CeilingFanHighCommand  CeilingFanOffCommand\n"  \
      "[slot 3] NoCommand  NoCommand\n"                         \
      "[slot 4] NoCommand  NoCommand\n"                         \
      "[slot 5] NoCommand  NoCommand\n"                         \
      "[slot 6] NoCommand  NoCommand\n"                         \
      "[undo] LightOnCommand\n\n"                               \
      "Light is off\n", @out.string
  end
  
  #Method that test the CeilingFan class
  def test_fan
    @rc.on_button_was_pushed(1)
    @rc.off_button_was_pushed(1)
    p @rc
    @rc.undo_button_was_pushed
    @rc.on_button_was_pushed(2)
    p @rc
    @rc.undo_button_was_pushed
    assert_equal                                                \
      "Living Room ceiling fan is on medium\n"                  \
      "Living Room ceiling fan is off\n"                        \
      "\n------ Remote Control -------\n"                       \
      "[slot 0] LightOnCommand  LightOffCommand\n"              \
      "[slot 1] CeilingFanMediumCommand  CeilingFanOffCommand\n"\
      "[slot 2] CeilingFanHighCommand  CeilingFanOffCommand\n"  \
      "[slot 3] NoCommand  NoCommand\n"                         \
      "[slot 4] NoCommand  NoCommand\n"                         \
      "[slot 5] NoCommand  NoCommand\n"                         \
      "[slot 6] NoCommand  NoCommand\n"                         \
      "[undo] CeilingFanOffCommand\n\n"                         \
      "Living Room ceiling fan is on medium\n"                  \
      "Living Room ceiling fan is on high\n"                    \
      "\n------ Remote Control -------\n"                       \
      "[slot 0] LightOnCommand  LightOffCommand\n"              \
      "[slot 1] CeilingFanMediumCommand  CeilingFanOffCommand\n"\
      "[slot 2] CeilingFanHighCommand  CeilingFanOffCommand\n"  \
      "[slot 3] NoCommand  NoCommand\n"                         \
      "[slot 4] NoCommand  NoCommand\n"                         \
      "[slot 5] NoCommand  NoCommand\n"                         \
      "[slot 6] NoCommand  NoCommand\n"                         \
      "[undo] CeilingFanHighCommand\n\n"                        \
      "Living Room ceiling fan is on medium\n", @out.string
  end

end