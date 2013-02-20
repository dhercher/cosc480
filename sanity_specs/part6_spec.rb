# describe "palindrome" do
#   it "should be defined for string" do
#     lambda { ''.palindrome? }.should_not raise_error(::NoMethodError)
#   end
#   it "should be defined for enumerable" do
#     lambda { [].palindrome? }.should_not raise_error(::NoMethodError)
#   end
# end

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  @@currency = 'dollar'
  def method_missing(method_id, *args, &block)  # capture all args in case have to call super
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
    	@@currency = singular_currency
    	self * @@currencies[singular_currency]
    elsif singular_currency == "in"
    	next_val = args[0].to_s.downcase.gsub( /s$/, '')
    	if @@currencies.has_key?(next_val)
    		self * @@currencies[@@currency] * @@currencies[next_val]
    	else
    		super
    	end
    else
      super
    end
  end
end

puts 10.yen.in(:Euros)