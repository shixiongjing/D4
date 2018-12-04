require 'pathname'

def insert_sort(arr, char)
  idx = arr.length
  arr << char
  unless arr[idx - 1] <= char || idx.zero?
    idx -= 1
    arr[idx + 1], arr[idx] = arr[idx], arr[idx + 1]
  end
  arr
end

def self.check_args(argv)
  if argv.count != 1
    puts(
      'Usage: ',
      'ruby word_finder.rb *graph_file*'
    )
    return false
  end

  unless Pathname.new(argv[0]).exist?
    puts 'Could not access file'
    return false
  end
  true
end
