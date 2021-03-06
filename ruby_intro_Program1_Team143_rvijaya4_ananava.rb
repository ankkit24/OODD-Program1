# Part 1

def unique_array(a)
  # ADD YOUR CODE HERE
  # 1. Check if the array is null
  if a==[]
    puts "Array cannot be empty"
    return a
  end
  #2. Check if there are different data types as well
  bool = a.all? {|i| i.is_a?(Integer)}
  if bool==false
    puts "Array cannot have different data types"
    return bool
  end
  #3. Normal case
  b=a.uniq
  puts "#{b}"
  return b
end



def two_sum?(a,n)
  # ADD YOUR CODE HERE
  # 1. Check if the array is null
  if a==[]
    puts "Array cannot be empty"
    return a
  end
  #2. Check if there are different data types as well
  bool = a.all? {|i| i.is_a?(Integer)}
  if bool==false
    puts "Array cannot have different data types"
    return bool
  end
  #3. Normal case
  found=0
  array=a.combination(2).to_a
  array.each do |x|
    if x.sum==n
      found+=1
    end
  end

  if found>0
    puts "true"
    return true
  else
    puts "false"
    return false
  end
end



def group_anagrams(a)
  # ADD YOUR CODE HERE
  b=Array.new
  for i in 0..a.length-1
    a[i].downcase!
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
  puts "#{g_anagrams}"
  return g_anagrams
end



# Part 2

def palindrome?(s)
  # ADD YOUR CODE HERE
  # 1. Null string
  if(s=="")
    puts "String cannot be null"
    return false
  end
  #2. String cannot have blank spaces
  if (s.match(/\s/))
    puts "No spaces allowed in the string"
    return false
  end
  if s.casecmp(s.reverse)==0
    puts "true"
    return true
  else
    puts "false"
    return false
  end
end



def remove_and_append_vowels(s)
  # ADD YOUR CODE HERE
  # 1. Null string
  if(s=="")
    puts "String cannot be null"
    return false
  end

  #2. String cannot have blank spaces
  if (s.match(/\s/))
    puts "No spaces allowed in the string"
    return false
  end

 #3. There are no vowels in upper or lower case
  if((s.downcase).gsub(/[aeiou]/,"")==s)
    puts "No Vowels present"
  end

  #4. Adding the condition where the Vowels can be in upper case
  puts s.gsub(/[aeiouAEIOU]/,"")+s.gsub(/[^aeiouAEIOU]/,"")
  return s.gsub(/[aeiouAEIOU]/,"")+s.gsub(/[^aeiouAEIOU]/,"")
end



def highest_frequency_word(s)
  # ADD YOUR CODE HERE
  # 1. Null string
  if(s=="")
    puts "String cannot be null"
    return false
  end

  arr=s.split(" ")
  #puts "#{arr}"
  count=Hash.new(0)
  arr.each do |x|
    count[x.downcase]+=1
  end
  #puts "#{count}"
  max_count=count.values.max

  # 2. When max_count is 1, it means all words are unique
  if(max_count==1)
    puts "All words are unique"
    return false
  end
  #puts "#{max_count}"
  word=count.key(max_count).downcase
  puts "#{word}"
  return word
end



# Part 3
class Book
  # ADD YOUR CODE HERE
  def initialize (name, price)
    # #1. Check if price is a string
    if (price.is_a? (String))
      puts "Price cannot be a string value, it has to be an number"
    end

    if name.nil? || name.length==0
      raise ArgumentError.new("Invalid name specified")
    end
    if price.nil? or price<=0
      raise ArgumentError.new("Invalid price specified")
    end

    # Calling the setter methods for name and price
    set_name(name)
    set_price(price)
  end

  def get_name
    @name
  end
  def get_price
    @price
  end
  def set_name(name)
    @name=name
  end
  def set_price(price)
    @price=price
  end

  def formatted_price
    book_price =get_price
    # use to_i to convert to an integer
    # divmod 1 divides the number into an array of before and after decimals
    b=book_price.divmod 1
    rem=((b[1].round(2))*100).to_i
    if(rem==100)
      b[0]+=1
      puts b[0]
      rem=0
      puts rem
    end
    # puts rem
    if(rem==0)
      if(b[0]==1)
        puts "1 dollar only"
        return "1 dollar only"
      else
        puts "#{b[0]}" + " dollars only"
        return "#{b[0]}" + " dollars only"
      end
    else
      if (rem==0.01)
        if(b[0]==1)
          puts "1 dollar and 1 cent only"
          return "1 dollar and 1 cent only"
        else
          puts "#{b[0]}" + " dollars and 1 cent only"
          return "#{b[0]}" + " dollars and 1 cent only"
        end
      else
        if(b[0]==1)
          puts "1 dollar and " + "#{rem}" + " cents only"
          return "1 dollar and " + "#{rem}" + " cents only"
        else
          puts "#{b[0]}" + " dollars and " + "#{rem}" + " cents only"
          return "#{b[0]}" + " dollars and " + "#{rem}" + " cents only"
        end
      end
    end
  end

end