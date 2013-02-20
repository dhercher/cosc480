# describe "anagrams" do
#   it "should be defined" do
#     lambda { combine_anagrams([]) }.should_not raise_error(::NoMethodError)
#   end

#   it "should return an Array" do
#     combine_anagrams([]).class.should == Array
#   end
# end

def combine_anagrams(words)
    #   <YOUR CODE HERE>
    hash = Hash.new
    words.each do |w|
    	t = w.chars.sort { |a, b| a.casecmp(b) } .join
    	if hash.has_key? t
    		hash[t] << w
    	else
    		hash[t] = w
    	end
    end
    res = []
	hash.keys.each do |l|
		res << hash[l]
	end
    return res
end

w = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
puts combine_anagrams w
