module Enumerable
  # 1.my_each
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in to_a
      yield i
    end    
    self
  end

  # 2.my_each_with_index
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i=0 
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
    for item in to_a
      if yield item
        new_arr << item
      end
    end
    new_arr
  end


end



