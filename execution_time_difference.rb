class Array
  
  #O(n^2)
  def my_min1 
    each_index do |i|
      new_arr = self[0...i] + self[i + 1..-1]
      a = new_arr.all? { |el| self[i] <= el }
      return self[i] if a
    end
  end
    
  #O(n)
  def my_min2
    smallest = self[0]
    
    self.each_index do |i|
      if self[i] < smallest
        smallest = self[i]
      end
    end
    
    smallest
  end
  
  #O(n^2)
  def largest_contiguous_subsum1
    ans = []
    
    each_index do |i|
      each_index do |j|
        next if j < i
        ans << self[i..j]
      end
    end
    
    sum = []
    ans.each do |subset|
      sum << subset.reduce(:+)
    end 
    
    ans[sum.index(sum.max)]
    
  end
  
  #O(n)
  def largest_contiguous_subsum2
    curr_sum = first
    winner_sum = first

    i = 0
    
    while i < length - 1
      next_num = self[i + 1]
      curr_sum = curr_sum + next_num 
      
      if curr_sum > winner_sum
        winner_sum = curr_sum
      end
      
      if next_num > winner_sum
        winner_sum = next_num
        curr_sum = next_num
      end
      
      i += 1
    end
    
    winner_sum
  end 
  #O(1)
  
end

list1 = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p list1.largest_contiguous_subsum2
p list2.largest_contiguous_subsum2
