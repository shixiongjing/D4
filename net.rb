
require 'trie'
require_relative 'helper'

class Net
  
  # Constructor of a network
  def initialize s, trie
    File.open(s, "r") do |f|
      num_end = 0
      @max_word = []
      @end_point = []
      @letter_arr = Array.new
      @net_arr = Array.new
      @rev_arr = Array.new
      @trie = trie
      f.each_line do |line|
        line = line.strip
        content = line.split(';')
        content[0] = content[0].to_i
        @letter_arr[content[0]] = content[1]
        if content[2].nil?
          #puts 'end point:' + content[0].to_s
          @end_point[num_end] = content[0]
          num_end += 1
        else
          dest = content[2].split(',')
          @net_arr[content[0]] = dest
          for x in dest
            x = x.to_i
            @rev_arr[x] = [] if @rev_arr[x].nil?
            @rev_arr[x] << content[0]
          end
        end
      end
    end
  end

  def find_word
    @max_length = 0
    for ep in @end_point
      traverse ep, 1, @letter_arr[ep]
    end
    @max_word
  end

  def traverse (start, length, str)
    unless @trie.get(str).nil?
      if length >= @max_length
        if length > @max_length
          @max_word = [] 
          @max_length = length
        end
        @max_word << @trie.get(str)
        if @trie.has_key?(str+'.')
          temp = (str.dup) + '.'
          @max_word << @trie.get(temp)
          temp = temp + '.'
          while @trie.has_key?(temp)
            @max_word << @trie.get(temp)
            temp = temp + '.'
          end
        end
        #puts 'add:'+str
      end
    end

    if !@rev_arr[start].nil?
      @rev_arr[start].each do |x|
        traverse(x, length+1, insert_sort(str, @letter_arr[x]))
      end
    end
  end

end