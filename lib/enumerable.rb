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
    i = 0
    while i < to_a.length
      if yield to_a[i]
        new_arr << to_a[i]
      end
      i += 1
    end
    new_arr
  end


end



