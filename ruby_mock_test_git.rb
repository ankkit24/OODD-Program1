
load 'ruby_intro_Program1_Team143_rvijaya4_ananava.rb'

def scores
  correct = 0
  wrong = 0
  full = 35

  # Q1
  begin
    unique_array([1,2,3,-4,-5,1,3,2]) == [1,2,3,-4,-5] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q2
  begin
    two_sum?([-1,-2,4,4],2) == true ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q3
  begin
    group_anagrams(['elbow','cried','below','cider']) == [['elbow','below'],['cried','cider']] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q4
  begin
    palindrome?("pop") == true ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q5
  begin
    remove_and_append_vowels("pray") == 'prya' ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q6
  begin
    highest_frequency_word("She says she got married.") == 'she' ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  #Q7
  begin
    b2 = Book.new("The Great Gatsby", 17.994668)
  rescue
    b2 = nil
  end

   begin
    b2.formatted_price=="17 dollars and 99 cents only" ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  puts correct+wrong
  puts correct, wrong, correct+wrong
  return ( (correct * full).to_f / (wrong + correct) ).round(2)
end

puts scores
