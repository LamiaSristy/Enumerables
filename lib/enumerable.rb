module Enumerable
  # 1.my_each
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < to_a.length
      yield to_a[i]
      i += 1
    end
    self
  end

  # 2.my_each_with_index
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < to_a.length
      yield(to_a[i], i)
      i += 1
    end
    self
  end

  # 3.my_select
  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    to_a.my_each { |item| new_arr << item if yield item }
    new_arr
  end

  # 3.my_all?
  def my_all?(param = nil)
    flag = true
    if  param.class == Class
       to_a.my_each { |item| return false if !(item.class == param || (item.class).superclass == param)  }

    elsif param.class == Regexp
        to_a.my_each {|item| return false if !(item.match(param))}

    elsif !block_given?
        to_a.my_each {|item| return false if item.nil? || !item}
    else
        to_a.my_each {|item| return false if !yield item }
    end
    flag
  end

  # 3.my_any?
  def my_any?(param = nil) 

    flag = false
     
    if  param.class == Class 
        to_a.my_each {|item| return true if (item.class == param || (item.class).superclass == param)}
    
    elsif param.class == Regexp    
        to_a.my_each {|item| return true  if (item.match(param))}

    elsif !block_given?
       
        to_a.my_each {|item| return true if !(item.nil? || !item)}

    else
        to_a.my_each {|item| return true if yield item }
    end       
    flag
  end

  # 3.my_none?
  def my_none?(param = nil) 
    !my_any?(&Proc.new)
  end

end



