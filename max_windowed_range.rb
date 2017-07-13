def naive_max_windowed_range(array, w)

  current_max_range = nil

  i = 0
  windows = []
  while i < (array.length - w + 1)
    sub_window = []
    j = i
    w.times do
      sub_window << array[j]
      j += 1
    end
    windows << sub_window
    i += 1
  end


  windows.each do |window|
    if current_max_range.nil?
      current_max_range = window.max - window.min
    end
    current_max_range = window.max - window.min if window.max - window.min > current_max_range
  end
  current_max_range

end

p naive_max_windowed_range([1, 0, 2, 5, 4, 8], 3)
