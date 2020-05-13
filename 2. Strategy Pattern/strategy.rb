class Student

  attr_reader :id, :name, :gender, :gpa

  def initialize(id, name, gender, gpa)
    @id = id
    @name = name
    @gender = gender
    @gpa = gpa
  end

end

class StudentStrategy

  def execute(array)
    raise 'Abstract method called!'
  end

end

class CountGenderStrategy < StudentStrategy
  
  def initialize(gender)
    @gender = gender
  end 
  
  def execute(array)
    count = 0
    array.each do |student|
      if student.gender == @gender
        count += 1
      end
    end
    count
  end
  
end

class ComputeAverageGPAStrategy < StudentStrategy
  
  def execute(array)
    gpa = 0
    array.each {|student| gpa += student.gpa}
    array.empty? ? nil : gpa / array.size
  end
end

class BestGPAStrategy < StudentStrategy
  def execute(array)
    array.empty? ? nil: array.sort{|student, student2| student.gpa <=> student2.gpa }[-1].name
  end
end


class Course

  def strategy=(new_strategy)
    if !new_strategy.is_a? StudentStrategy
      raise 'Invalid argument. Was expecting a StudentStrategy.'
    end
    @strategy = new_strategy
  end

  def initialize
    @students = []
    @strategy = nil
  end

  def add_student(student)
    @students.push(student)
  end

  def execute
    @strategy.execute(@students)
  end

end
