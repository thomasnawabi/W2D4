require 'byebug'


def my_min1(array)

  array.each do |el1|
    return el1 if array.none? {|el2| el2 < el1}
  end
end
#Time complexity == O(n^2)
#Space complexity == O(1)


def my_min2(array)
  lowest_num = array.first
  array.each do |el1|
    next if lowest_num == el1
    if el1 < lowest_num
      lowest_num = el1
    end
  end
  lowest_num
end
#Time complexity == O(n)
#Space complexity == O(1)


def largest_contiguous_subsum1(array)
  sub_array = []

  array.each_index do |i|
    array.each_index do |j|
      next if i > j
      sub_array << array[i..j]
    end
  end
  sum = sub_array.first.inject(:+)
  sub_array.each do |el|
    sum = el.inject(:+) if el.inject(:+) > sum
  end
  sum
end
#Time complexity == O(n^3)
#Space complexity == O(n^2)


def largest_contiguous_subsum2(array)
  #all negative numbers
  if array.none? {|el| el > 0 }
    max = array.first
    array.each do |el1|
      next if max == el1
      if el1 > max
        max = el1
      end
    end
    max
  end

  current_sum = 0
  max_sum = 0

  array.each do |num|
      current_sum += num
      max_sum = current_sum if current_sum > max_sum
      if current_sum < 0
        current_sum = 0
        next
        current_sum += num
        max_sum = current_sum if current_sum > max_sum
      end

  end
  max_sum

end
#Time complexity == O(n)
#Space complexity == O(1)























if __FILE__ == $PROGRAM_NAME
  list = [2, 3, -6, 7, -6, 7]
    p  largest_contiguous_subsum2(list)

end
