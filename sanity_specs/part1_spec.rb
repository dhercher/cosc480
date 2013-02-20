

# describe "#palindrome?" do
#   it "should be defined" do
#     lambda { palindrome?("Testing") }.should_not raise_error(::NoMethodError)
#   end
# end

def palindrome?(string)
  # your code here
  str = string.downcase.gsub(/\W/, '')
  if str == str.reverse
  	return true
  else
  	return false
  end
end

class String
	def method_missing(method_id, *args, &block)
		method_id = method_id.to_s
		if method_id == 'palindrome?'
			palindrome?(self)
		else
			super
		end
	end
end

puts palindrome?("Madam, I'm Adam!")

# describe "#count_words" do
#   it "should be defined" do
#     lambda { count_words("Testing") }.should_not raise_error(::NoMethodError)
#   end

#   it "should return a Hash" do
#     count_words("Testing").class.should == Hash
#   end
# end

def count_words(string)
  # your code here
  	str = string.downcase.split
  	hash = Hash.new
	str.each do |i|
		if(hash.has_key?(i))
			hash[i] = hash[i] + 1
		else
			hash[i] = 1
		end
	end
	return hash
end

puts count_words "Doo bee doo bee doo"

