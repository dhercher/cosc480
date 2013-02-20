class Dessert
  def initialize(name, calories)
    # YOUR CODE HERE
    @name = name
    @calories = calories
  end

  attr_accessor :name
  attr_accessor :calories

  def healthy?
    # YOUR CODE HERE
    if @calories < 200
      return true
    else
      return false
    end
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  attr_accessor :flavor
  def delicious?
    if @flavor =~ /black licorice/i
      return false
    end
    super
  end
end



# describe "dessert" do
#   it "should define a constructor" do
#     lambda { Dessert.new }.should_not raise_error(::NoMethodError)
#   end
#   %w(healthy? delicious?).each do |method|
#     it "should define #{method}" do
#       Dessert.new('a',1).should respond_to method 
#     end
#   end
# end

# describe "jellybean" do
#   it "should define a constructor" do
#     lambda { JellyBean.new }.should_not raise_error(::NoMethodError)
#   end
#   %w(healthy? delicious?).each do |method|
#     it "should define #{method}" do
#       JellyBean.new('a',1,'b').should respond_to method 
#     end
#   end
# end

d = Dessert.new "Cake", 150
d = JellyBean.new "JellyBean", 25, "red"
puts d.name
puts d.calories
d.calories= 250
puts d.healthy?
puts d.delicious?
puts d.name
puts d.calories

