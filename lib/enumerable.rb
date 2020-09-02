# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

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

  # 4.my_all?
  def my_all?(param = nil)
    if param.class == Class
      to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
    elsif param.class == Regexp
      to_a.my_each { |item| return false unless item.match(param) }
    elsif !block_given?
      to_a.my_each { |item| return false if item.nil? || !item }
    else
      to_a.my_each { |item| return false unless yield item }
    end
    true
  end

  # 5.my_any?
  def my_any?(param = nil)
    if param.class == Class
      to_a.my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
    elsif param.class == Regexp
      to_a.my_each { |item| return true if item.match(param) }
    elsif !block_given?
      to_a.my_each { |item| return true unless item.nil? || !item }
    else
      to_a.my_each { |item| return true if yield item }
    end
    false
  end

  # 6.my_none?
  def my_none?(param = nil)
    if block_given?
      !my_any?(&Proc.new)
    else
      !my_any?(param)
    end
  end

  # 7.my_count?
  def my_count(param = nil)
    c = 0
    if block_given?
      to_a.my_each { |item| c += 1 if yield(item) }
    elsif !block_given? && param.nil?
      c = to_a.length
    else
      c = to_a.my_select { |item| item == param }.length
    end
    c
  end

  # 8.my_maps
  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given? || !proc.nil?

    arr = []
    if proc.nil?
      to_a.my_each { |item| arr << yield(item) }
    else
      to_a.my_each { |item| arr << proc.call(item) }
    end
    arr
  end

  # 9.my_inject
  def my_inject(initial = nil, sym = nil)
    if !block_given? && !sym.nil?
      to_a.my_each { |item| initial = initial.nil? ? item : initial.send(sym, item) }
    else
      to_a.my_each { |item| initial = initial.nil? ? item : yield(initial, item) }
    end
    initial
  end
end

# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
