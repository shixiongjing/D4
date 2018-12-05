require 'trie'
require_relative 'helper'

# Class of networks
class Net
  attr_accessor :rev_arr, :max_word
  # Constructor of a network
  def initialize(file, trie)
    num_end = 0
    @max_word = []
    @end_point = []
    @letter_arr = []
    @rev_arr = []
    @trie = trie
    file.each_line do |line|
      line = line.strip
      content = line.split(';')
      content[0] = content[0].to_i
      @letter_arr[content[0]] = content[1]
      if content[2].nil?
        @end_point[num_end] = content[0]
        num_end += 1
      else
        dest = content[2].split(',')
        dest.each do |x|
          x = x.to_i
          @rev_arr[x] = [] if @rev_arr[x].nil?
          @rev_arr[x] << content[0]
        end
      end
    end
  end

  def find_word
    @max_length = 0
    @end_point.each do |ep|
      traverse ep, 1, @letter_arr[ep]
    end
    @max_word
  end

  def traverse(start, length, str)
    unless @trie.get(str).nil?
      if length >= @max_length
        if length > @max_length
          @max_word = []
          @max_length = length
        end
        @max_word << @trie.get(str)
        if @trie.has_key?(str + '.')
          temp = str.dup + '.'
          @max_word << @trie.get(temp)
          temp += '.'
          while @trie.has_key?(temp)
            @max_word << @trie.get(temp)
            temp += '.'
          end
        end
      end
    end

    @rev_arr[start].each { |x| traverse(x, length + 1, insert_sort(str, @letter_arr[x])) } unless @rev_arr[start].nil?
  end
end
