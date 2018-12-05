def insert_sort(arr, char)
  idx = arr.length
  temp = arr.dup
  temp << char
  until idx.zero? || (temp[idx - 1] <= char)
    idx -= 1
    temp[idx + 1], temp[idx] = temp[idx], temp[idx + 1]
  end
  # puts 'adding: ' + char
  # puts 'orinigal: ' + arr
  # puts 'sorted:' + temp
  temp
end

def check_args(argv)
  if argv.count != 1
    puts(
      'Usage: ',
      'ruby word_finder.rb *graph_file*'
    )
    return false
  end

  unless File.exist?(argv[0])
    puts 'Could not access file'
    return false
  end
  true
end

def read_dictionary
  File.readlines('wordlist.txt')
end
