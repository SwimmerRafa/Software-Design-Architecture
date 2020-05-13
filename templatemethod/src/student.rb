# Template Method Pattern
# Date: 24-Feb-2020
# Authors:
#          A01378916 Rafael Moreno Cañas 
#          A01379896 Erick Bautista Pérez


# File name: student.rb

# The source code contained in this file demonstrates how to
# implement the <em>template pattern</em>.

# A class that models attributes of a /student 
class Student

  include Enumerable
  # Note: This class does not support the max, min, 
  # or sort methods.

#A method that initialites all attributes
  def initialize(id, name, grades)
    @id = id
    @name = name
    @grades = grades
  end

#A method that returnd the string representation of student id and name
  def inspect
    "Student(#{@id}, #{@name.inspect})"
  end

#Method that calculate the student average 
  def grade_average
    @grades.inject(:+)/@grades.size
  end

#Method that executes fields id, name, grades and average
  def each &block
    yield @id
    yield @name
    @grades.each(&block)
    yield grade_average
  end

end