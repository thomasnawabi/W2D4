require 'byebug'


def bad_two_sum?(arr, target_sum)

  arr.each_index do |i|
    arr.each_index do |j|
      next if i >= j
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end






def okay_two_sum?(arr, target_sum)
  sorted_arr = merge_sort(arr)
  sorted_arr.each_with_index do |el, idx|
    next if idx == sorted_arr.length - 1
    return true if el + sorted_arr[idx+1] == target_sum
  end
  false
end
#Time complexity is O(n log n)
#space complexity is O(n)

def b_search(arr, target)
  return nil if arr.empty?

  middle = arr.length / 2

  left_side = arr[0...middle]
  right_side = arr[middle + 1 .. -1]

  case arr[middle] <=> target
  when -1
    result = b_search(right_side, target)
    result.nil? ? nil : result + middle + 1
  when 0
    middle
  when 1
    b_search(left_side, target)
  end
end

def merge_sort(arr, &block)
  block ||= Proc.new { |x, y| x <=> y }
  return arr if arr.length <= 1

  midpoint = arr.count / 2

  left = merge_sort(arr.take(midpoint), &block)
  right = merge_sort(arr.drop(midpoint), &block)

  merge(left, right, &block)
end


def merge(left, right, &block)
  merged = []

  until left.empty? || right.empty?
    case block.call(left.first, right.first)
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  merged.concat(left)
  merged.concat(right)
  merged
end

def two_sum_hash?(arr, target_sum) # O(n) time, O(n) space
  nums = {}

  arr.each do |num|
    # if there exists a number in our hash such that it plus our current num == target_sum
    # return true.
    return true if nums[target_sum - num] # constant time operation
    nums[num] = true
  end
  false
end




arr = [0, 1, 5, 7]
p two_sum_hash?(arr, 6)
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
