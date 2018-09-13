# Part 1

def unique_array(a)
  # ADD YOUR CODE HERE
  # puts "Printing unique elements:"
  # print a.uniq
  return a.uniq
end

def two_sum?(a,n)
  # ADD YOUR CODE HERE
  for counter in 0..a.length-1
    for i in counter+1..a.length-1
      if (a.at(counter)+a.at(i)==n)
        return true
      end
    end
     puts
  end
end

def group_anagrams(a)
  # ADD YOUR CODE HERE
  b=Array.new
  for i in 0..a.length-1
      total=0
      a.at(i).each_byte do |c|
        total+=c
      end
      b[i]=total
   # puts b[i]
  end
  for i in 0..a.length-1
    key=b[i]
    # key_str=a[i]
    for j in i+1..a.length-1
      if(b[j]==key)
        b[i+1], b[j]= b[j], b[i+1]
        a[i+1], a[j]= a[j], a[i+1]
      end
    end
  end
  # puts a
  # puts b
  # a=["restful","hour","fluster","rouh"]

  #Printing in the required order
  # Works for both single and double quotes
  g_anagrams=Array.new
  i=0
  while (i<=a.length-1)
    #print i
    c=Array.new
    j=i
    while(j+1<=a.length-1&&b[j]==b[j+1])
      c.push(a[j])
      j+=1
    end
    c.push(a[j])
    g_anagrams.push(c)
    i+=2
  end
  return g_anagrams
end

# Part 2

def palindrome?(s)
  # ADD YOUR CODE HERE
  # Use either downcase! or upcase! to convert and store in the variable
  s.downcase!
  if(s==s.reverse)
    return true
  end
end

def remove_and_append_vowels(s)
  # ADD YOUR CODE HERE
    return s.gsub(/[aeiou]/,"")+s.gsub(/[^aeiou]/,"")
end

def highest_frequency_word(s)
  # ADD YOUR CODE HERE
  s.downcase!
  a=s.split
  prev_counter=0
  for i in 0..a.length-1
    # key=a[i]
    counter=0
    for j in 0..a.length-1
      if(a[j]==a[i])
        counter+=1
      end
    end
    if(counter>prev_counter)
      prev_counter=counter
      string=a[i]
    end
  end
  return string
end

# Part 3

class Book
  # ADD YOUR CODE HERE

  def initialize *args

    #instance variables in ruby are always private
    @bname,@bprice = args

    if (@bname==''||@bname==nil)
      raise ArgumentError
    end
    if (@bprice==nil||@bprice<=0)
      raise ArgumentError
    end

  end

  def formatted_price
    book_price=@bprice

    #use to_i to convert to an integer
    # divmod 1 divides the number into an array of before and after decimals
    b=book_price.divmod 1
    rem=((b[1].round(2))*100).to_i
    # puts rem
    if(rem==0)
      return "#{b[0]}" + "dollars only"
    else
      return "#{b[0]}" + " dollars and " + "#{rem}" + " cents only"
    end
  end

end