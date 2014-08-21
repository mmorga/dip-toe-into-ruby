# Dip Your Toe Into Ruby

Start up a Pry or IRB window.

```sh
> pry
[1] pry(main)>
```

Every line of code in Ruby results has a return value.

```ruby
[1] pry(main)> "Hello World"
=> "Hello World"
```

To output something from a Ruby script, use `puts`

```ruby
[1] pry(main)> puts "Hello World"
"Hello World"
=> nil
```

Try some math.

```ruby
[1] pry(main)> 3*2
[1] pry(main)> 3**2
[1] pry(main)> Math.sqrt(9)
```

About modules. Collection of related methods. Also allows sharing a group of functionality between multiple classes or instances.

Defining a function.

```ruby
[1] pry(main)> def h
[1] pry(main)> puts "Hello World!"
[1] pry(main)> end
[1] pry(main)> h
Hello World!
[1] pry(main)> h()
Hello World!
```

Add a parameter.

```ruby
def h(name)
  puts "Hello #{name}!"
end
```

Setting parameter defaults.

```ruby
def h(name = "World")
  puts "Hello #{name}!"
end
```

Creating a class.

```ruby
class Greeter
  def initialize(name = "World")
    @name = name
  end
  def say_hi
    puts "Hi #{@name}!"
  end
  def say_bye
    puts "Bye #{@name}, come back soon."
  end
end
```

Now use it:

```ruby
g = Greeter.new("Mark")
g.say_hi
g.say_bye
```

Ruby knows all about objects:

```ruby
Greeter.instance_methods
Greeter.instance_methods(false)
g.respond_to?("name")
g.respond_to?("say_hi")
g.respond_to?("to_s")
```

Classes are open. Also - lookie there it's a `symbol`.

```ruby
class Greeter
  attr_accessor :name
end

g = Greeter.new("Andy")
g.respond_to?("name")
g.respond_to?(:name)
g.respond_to?("name=")

g.name = "Betty"
g.say_hi
```

Ok - bigger example. This is located in `examples/example1.rb`

```ruby
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
```

Run this then talk through the methods.

About that one line:

```ruby
if __FILE__ == $0
```
__FILE__ is the magic variable that contains the name of the current file.
$0 is the name of the file used to start the program.

This lets you run something in the file only if the file is being run as the main program or to make use of classes without running extra stuff.

# What is a scripting language?

Ruby can be used as a scripting language. Definition of scripting language is left as an exercise to the reader.

# Your Two Favorite Data Structures

## Arrays (think: List, Queue)

You can put anything into an Array.

```ruby
fruit = ["Apple", "Pear", "Banana", "Peach"]
stuff = ["Frank", 4, 12.5, Math::PI, Array, [23, "skidoo"]]

# Or for strings, there are nifty shortcuts
fruit = %w(Apple Pear Banana Peach)
fruit = %W(Apple Pear Ba#{"na"*2} Peach)
```

Arrays have lots of cool methods you can call on them.

```ruby
fruit.first # Or last
fruit[3] # Give me the 4th fruit because software
fruit.min # Or max
fruit.push("Orange") # you can also use the << operator
fruit.push("Orange") # Wait now there's two of them.
=> ["Apple", "Pear", "Banana", "Peach", "Orange", "Orange"]
fruit.pop # Hey - it's a stack
=> "Orange"
fruit
=> ["Apple", "Pear", "Banana", "Peach", "Orange"]
fruit.length
fruit.index('Banana') # Where did I put that Banana?
fruit.insert(2,'Banana') # Can't have too many Bananas
fruit.insert(-1, 'Kiwi') # What the?
fruit.uniq
=> ["Apple", "Pear", "Banana", "Peach", "Orange"]
fruit
=> ["Apple", "Pear", "Banana", "Banana", "Peach", "Orange"] # Hey what gives?
fruit.uniq!
=> ["Apple", "Pear", "Banana", "Peach", "Orange"]
fruit
=> ["Apple", "Pear", "Banana", "Peach", "Orange"]
fruit.reverse # see also reverse!
=> ["Orange", "Peach", "Banana", "Banana", "Pear", "Apple"]
fruit.sort
=> ["Apple", "Banana", "Banana", "Orange", "Peach", "Pear"]
fruit.sample # Pick a random member
fruit.rotate(1)
fruit[1..3]
=> ["Pear", "Banana", "Peach"]
fruit.length
fruit.count
fruit.unshift 'Lemon' # Insert at the beginning - Hey Ruby, your Perl is showing
=> ["Lemon", "Apple", "Banana", "Banana", "Orange", "Peach", "Pear"]
fruit.shift # Pulls item off at the beginning
=> "Lemon"
fruit.join(",")
=> "Apple, Pear, Banana, Peach, Orange"
```

## Hashes (think: Dictionary, Map or HashMap)

```ruby
apple = { "Color" => "Red", "Size" => "Medium", "SweetSourValue" => 7 }
# Usually though, you'd use symbols to express this like this
apple = { :color => "Red", :size => "Medium", :sweet_sour_value => 7 }
# In modern Ruby (1.9+) a more JSON like syntax is preferable
apple = { color: "Red", size: "Medium", sweet_sour_value: 7 }
```

Using a hash:

```ruby
apple[:size]
=> "Medium"
apple.keys
=> [:color, :size, :sweet_sour_value]
apple.values
=> ["Red", "Medium", 7]
apple.value?(7)
=> true
apple.key?(:color) # Also include?() or
=> true
apple.key?(:smell)
=> false
apple.merge(smell: "Sweet", shape: "Round") # Use merge! for in-place merge
=> {:color=>"Red", :size=>"Medium", :sweet_sour_value=>7, :smell=>"Sweet", :shape=>"Round"}

```

# Doing stuff more than once

Ruby has a bunch of tools to make iterating over things easier.

```ruby
15.times { print "Na" };puts " Batman!"

fruit.each { |f| puts "I like #{f}" }

# I want all of the fruit that start with a 'P'
fruit.select { |f| f[0] == 'P' }
=> ["Pear", "Peach"]
# I want all of the fruit that don't start with a 'P'
fruit.reject { |f| f[0] == 'P' }
=> ["Apple", "Banana", "Orange"]
# I want to be cute - you can use collect() also
fruit.map { |f| "#{f}y" }
=> ["Appley", "Peary", "Bananay", "Peachy", "Orangey"]
# Better example - say your estimates are in an Array and you want to tell mgmt
estimates = [3,5,4,2].map { |e| e * 3 }
=> [9, 15, 12, 6]
# Lets sum up those estimates:
estimates.reduce { |total, e| total + e }
=> 42
# A cool shortcut for this is
estimates.reduce(:+)
=> 42
# Hmm - any estimate should start with 10
estimates.reduce(10) { |total, e| total + e }
=> 52
# Maybe multiply
=> 9720
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end
=> "sheep"
```
