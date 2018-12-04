class Net
  
  def initialize s
    File.open(s, "r") do |f|
      num_end = 0
      @max_word = []
      @letter_arr = Array.new
      @net_arr = Array.new
      @rev_arr = Array.new
      f.each_line do |line|
        puts line
        content = line.split(':')
        @letter_arr[content[0]] = content[1]
        dest = content[2].split(',')
        @net_arr[content[0]] = dest
        if content[2] == ''
          @end_point[num_end] = content[0]
          num_end += 1
        else
          for x in dest
            @rev_arr[x] = [] if @rev_arr[x].nil?
            @rev_arr[x] << content[0]
          end
        end
      end
    end
  end

  def find_word
    str = nil
    max_length = 0
    for ep in @end_point
      traverse ep, 0
    end
  end

  def traverse start, length
    unless @rev_arr[start].nil?
      for x in @rev_arr[start]
        
      end
    end
  end

end
