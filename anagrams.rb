


def first_anagram?(str1, str2)

  permutation(str1).include?(str2)

end
#Time complexity O(n!)
#Space complexity O(n!)


def permutation(string)
  return [string] if string.size < 2
  char = string[0]
  total_perms = []
  perms = permutation(string[1..-1])

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + char + perm[i..-1]
    end
  end

  total_perms
end

def second_anagram?(str1, str2)
  str1_ans = str1.chars.dup
  str2_ans = str2.chars.dup
  str1.chars.each do |char1|
    str2.chars.each do |char2|
      if char1 == char2
        str1_ans.delete(char1)
        str2_ans.delete(char2)
      end
    end
  end
  str1_ans == str2_ans
end
#Time complexity O(n^2)
#Space copmlexity O(1)

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end
#Time complexity O(n^2) for quicksort

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.chars.each do |ch1|
    hash1[ch1] += 1
  end
  str2.chars.each do |ch2|
    hash2[ch2] += 1
  end
  p hash1
  p hash2
  hash1 == hash2

end
#Time complexity == O(n)
#Space complexity == O(n)
p fourth_anagram?("gizmo","sally")
p fourth_anagram?("elvis","lives")
