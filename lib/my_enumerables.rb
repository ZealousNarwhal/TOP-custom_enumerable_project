module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0;
    self.my_each do |element|
      yield(element, index)
      index += 1;
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    output = []
    self.my_each do |element|
      output.push(element) if yield(element)
    end
    return output
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.my_each do |element|
      return false unless yield(element)
    end
    return true
  end

  def my_any?
    return to_enum(:to_any?) unless block_given?

    my_each do |element|
      return true if yield(element)
    end
    return false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    
    self.my_each do |element|
      return false if yield(element)
    end
    return true;
  end

  def my_count
    output = 0
    if block_given? 
      self.my_each { |element| output += 1 if yield(element) }
    else 
      self.my_each { |element| output += 1 }
    end
    return output
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    output = []
    self.my_each do |element|
      output.push(yield(element))
    end
    return output
  end

  def my_inject(acc = nil)
    return to_enum(:my_inject) unless block_given?
    
    self.my_each do |element|
      acc = yield(acc, element)
    end
    return acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield(element)
    end
  end
end
