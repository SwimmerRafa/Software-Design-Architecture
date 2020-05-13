# Adapter Pattern
# Date: 13-Apr-2020
# Authors:
#          A01378916 Rafael Moreno Cañas
#          A01379896 Erick Bautista Perez

# File: queue_adapter.rb

#Adapter class that makes a SimpleQueue instance, behave like a Last-In First-Out (LIFO) stack.


class QueueAdapter < SimpleQueue
  #Initializes a new stack, using q as the adaptee.
  def initialize(q)
    @q = q
    @stack = []
  end
  
  #Inserts x at the top of this stack. Returns this stack.
  def push(x)
    p = @stack.unshift(x)
    @q.insert(p)
    self
  end
  
  #Returns nil if this stack is empty, otherwise removes and returns its top element.
  def pop
    if empty?
      nil
    else
      @q.remove
      @stack.shift
    end
  end
  
  #Returns nil if this stack is empty, otherwise returns its top element without removing it.
  def peek
    if empty?
      nil
    else
      @stack.first
    end
  end
  
  #Returns true if this stack is empty, otherwise returns false.
  def empty?
    @q.empty?
  end
  
  #Returns the number of elements currently stored in this stack.
  def size
    @q.size
  end
  
  
end