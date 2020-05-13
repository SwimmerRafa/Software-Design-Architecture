# Adapter Pattern
# Date: 13-Apr-2020
# Authors:
#          A01378916 Rafael Moreno Cañas
#          A01379896 Erick Bautista Perez

# File: simple_queue.rb

# IMPORTANT: Do not modify the following class in any way!

#This class contains a First-In First-Out (FIFO) data structure.
class SimpleQueue
#Initialize our class with an empty array.
  def initialize
    @info =[]
  end

#Inserts x at the back of this queue. Returns this queue.
  def insert(x)
    @info.push(x)
    self
  end

#Removes and returns the element at the front of this queue. Raises an exception if this queue happens to be empty.
  def remove
    if empty?
      raise "Can't remove if queue is empty"
    else
      @info.shift
    end
  end

#Returns true if this queue is empty, otherwise returns false.
  def empty?
    @info.empty?
  end

#Returns the number of elements currently stored in this queue.
  def size
    @info.size
  end

#Function that creates the interface
  def inspect
    @info.inspect       
  end

end