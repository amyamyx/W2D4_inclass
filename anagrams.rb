class String 

  def first_anagram?(str2)
    self.chars.permutation.to_a.map(&:join).include?(str2)
  end 

  def second_anagram?(str2)
    str1_dup = self.dup.chars
    str2_dup = str2.dup.chars
    self.chars.each_with_index do |letter, i|
      if str2.include?(letter)
        str1_dup.delete_at(i)
        str2_dup.delete_at(str2_dup.index(letter))
      end
    end
    
    str1_dup.empty? && str2_dup.empty?
  end

end

str1 = "gizmo"
str2 = "sally"
str3 = "elvis"
str4 = "lives"
 
p str3.second_anagram?(str4) == true
p str1.second_anagram?(str2) == false