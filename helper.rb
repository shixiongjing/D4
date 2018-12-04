

def insert_sort(arr, char)
  idx = arr.length
  arr << char
  until (idx.zero?) or (arr[idx - 1] <= char)
    idx -= 1
    arr[idx + 1], arr[idx] = arr[idx], arr[idx + 1]
  end
  puts 'sorted:' + arr
  arr
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
  dict = File.readlines('wordlist.txt')
end
