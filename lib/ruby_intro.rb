# frozen_string_literal: true

#git status
# git add -A
# git commit -m "Description of work done"
# git push

# **************************************** Part 1 ****************************************

=begin
Define a method sum(array) that takes an array of integers as an argument and 
returns the sum of its elements. For an empty array it should return zero. Run 
associated tests via: $ rspec -e '#sum ' spec/part1_spec.rb (Make sure you are 
in the correct directory: cd assignment and rspec is installed)
=end
def sum(arr)
  # YOUR CODE HERE
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  elsif arr.length == 2
    return arr[0] + arr[1]
  else
    sum_of_array = 0
    arr.each { |num| sum_of_array += num }
    return sum_of_array
  end
end

=begin
Define a method max_2_sum(array) which takes an array of integers as an argument
and returns the sum of its two largest elements. For an empty array it should 
return zero. For an array with just one element, it should return that element 
(Consider if the two largest elements are the same value as well). Run associated
tests via: $ rspec -e '#max_2_sum' spec/part1_spec.rb
=end
def max_2_sum(arr)
  # YOUR CODE HERE
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  elsif arr.length == 2
    return arr[0] + arr[1]
  else
    sort_arr = arr.sort
    rev_arr = sort_arr.reverse
    return rev_arr[0] + rev_arr[1]
  end
end

=begin
Define a method sum_to_n?(array, n) that takes an array of integers and an 
additional integer, n, as arguments and returns true if any two elements in the 
array of integers sum to n. sum_to_n?([], n) should return false for any value 
of n, by definition. 
Run associated tests via: $ rspec -e '#sum_to_n' spec/part1_spec.rb
=end
def sum_to_n?(arr, number)
  # YOUR CODE HERE
  if arr.length == 0
    return false
  elsif arr.length == 1
    return false
  else
    exists = arr.combination(2).select { | element | element.sum == number }
    num = exists.length
    if num == 0
      return false
    else
      return true
    end
  end
end

# **************************************** Part 2 ****************************************
=begin
Define a method hello(name) that takes a string representing a name and returns 
the string "Hello, " concatenated with the name. 
Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb 
=end
def hello(name)
  # YOUR CODE HERE
  hello_name = "Hello, " + name
  return hello_name
end

=begin
Define a method starts_with_consonant?(s) that takes a string and returns true 
if it starts with a consonant and false otherwise. (For our purposes, a 
consonant is any English letter other than A, E, I, O, U.) Make sure it works 
for both upper and lower case and for non-letters. Run associated tests 
via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb
=end
def starts_with_consonant?(string)
  # YOUR CODE HERE
  string =~ /\A[a-zA-Z&&[^aeiouAEIOU]]/
end

=begin
Define a method binary_multiple_of_4?(s) that takes a string and returns true if
the string represents a binary number that is a multiple of 4, such as '1000'. 
Make sure it returns false if the string is not a valid binary number. Run 
associated tests via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
=end
def binary_multiple_of_4?(string)
  # YOUR CODE HERE
  if string !~ /[^01]/
    string_length = string.length
    if string[string_length - 1] == "0" && string[string_length - 2] == "0"
      return true
    else
      return false
    end
  else
    return false
  end
end

# **************************************** Part 3 ****************************************
=begin
Define a class BookInStock which represents a book with an ISBN number, isbn, 
and price of the book as a floating-point number, price, as attributes. Run 
associated tests via: $ rspec -e 'getters and setters' spec/part3_spec.rb 
(Make sure you are in the correct directory: cd assignment)

The constructor should accept the ISBN number (a string, since in real life 
ISBN numbers can begin with zero and can include hyphens) as the first argument 
and price as second argument, and should raise ArgumentError (one of Ruby's 
built-in exception types) if the ISBN number is the empty string or if the price
is less than or equal to zero. Include the proper getters and setters for these 
attributes. Run associated tests via: $ rspec -e 'constructor' spec/part3_spec.rb

Include a method price_as_string that returns the price of the book formatted 
with a leading dollar sign and two decimal places, that is, a price of 20 should
format as $20.00 and a price of 33.8 should format as $33.80. Check out formatted
string methods in Ruby. Run associated tests 
via: $ rspec -e '#price_as_string' spec/part3_spec.rb

You can check your progress on all of the above by running rspec spec/part3_spec.rb.
=end
# Object representing a book
class BookInStock
  # YOUR CODE HERE
  attr_accessor :isbn, :price
  #constructor
  def initialize(isbn, price)
    
    if (isbn.empty? || price <= 0)
      raise(ArgumentError, "ISBN number is the empty string or if the price
is less than or equal to zero.")
    end
    
    @isbn = isbn
    @price = Float(price)
  end
  
  def price_as_string
    return format_price = "$%0.2f" % [price]
  end
end