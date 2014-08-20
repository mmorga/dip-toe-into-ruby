# Dip Your Toe Into Ruby

Start up a Pry or IRB window.

```bash
> pry
[1] pry(main)>
```

Every line of code in Ruby results has a return value.

```bash
[1] pry(main)> "Hello World"
=> "Hello World"
```

To output something from a Ruby script, use `puts`

```bash
[1] pry(main)> puts "Hello World"
"Hello World"
=> nil
```

Try some math.

```bash
[1] pry(main)> 3*2
[1] pry(main)> 3**2
[1] pry(main)> Math.sqrt(9)
```

About modules. Collection of related methods. Also allows sharing a group of functionality between multiple classes or instances.

Defining a function.

```bash
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

# Working with Files

Already saw the current filename variable `__FILE__` - Ruby has two classes that make working with files easier: `Dir` and `File`

## Dir

```ruby
Dir.pwd
Dir.home
Dir.chdir "bin"
Dir.chdir ".."
Dir.entries "examples"
Dir.glob "**/*.rb"
=> ["examples/example1.rb"]
Dir.mkdir "silly"
Dir.entries "."
Dir.rmdir "silly"
```

## File

```ruby
File.exist?("Gemfile")
=> true
File.basename("Gemfile.lock")
=> "Gemfile.lock"
File.realpath("Gemfile")
=> "/Users/mmorga/Box Sync/Classes/Ruby/Gemfile"
File.basename(File.realpath("Gemfile"))
=> "Gemfile"
=> "/Users/mmorga/Box Sync/Classes/Ruby/Gemfile"
File.dirname(File.realdirpath("Gemfile"))
=> "/Users/mmorga/Box Sync/Classes/Ruby"
File.dirname("Gemfile")
=> "."
```

### Reading a file

Lots of ways to do this:

```ruby
f = File.read("Gemfile")
=> "source \"https://rubygems.org\"\n\ngroup :development, :test do\n  gem \"pry\"\n  gem \"rubocop\"\n  gem \"minitest\"\n  gem \"minitest-context\"\n  gem \"minitest-colorize\"\n  gem \"minitest-documentation\"\n  gem \"guard\"\n  gem \"guard-minitest\"\n  gem \"guard-bundler\"\n  gem \"guard-rubocop\"\nend\n\ngroup :test do\n  gem \"simplecov\", require: false\nend\n"
f = File.readlines("Gemfile")
=> ["source \"https://rubygems.org\"\n",
 "\n",
 "group :development, :test do\n",
 "  gem \"pry\"\n",
 "  gem \"rubocop\"\n",
 "  gem \"minitest\"\n",
 "  gem \"minitest-context\"\n",
 "  gem \"minitest-colorize\"\n",
 "  gem \"minitest-documentation\"\n",
 "  gem \"guard\"\n",
 "  gem \"guard-minitest\"\n",
 "  gem \"guard-bundler\"\n",
 "  gem \"guard-rubocop\"\n",
 "end\n",
 "\n",
 "group :test do\n",
 "  gem \"simplecov\", require: false\n",
 "end\n"]
source "https://rubygems.org"

group :development, :test do
  gem "pry"
  gem "rubocop"
  gem "minitest"
  gem "minitest-context"
  gem "minitest-colorize"
  gem "minitest-documentation"
  gem "guard"
  gem "guard-minitest"
  gem "guard-bundler"
  gem "guard-rubocop"
end

group :test do
  gem "simplecov", require: false
end
```

### Common File Types like CSV and YAML

Ruby has classes to make it easier to read YAML and CSV files.

```ruby
require 'csv'
=> true
[138] pry(main)> CSV.foreach("data/RaisedBedGardenCosts.csv") do |line|
[138] pry(main)*   puts line.inspect
[138] pry(main)* end
[nil, nil, nil, "Option 1", nil, nil, nil, nil, "Option 2", nil, nil, nil, nil, "Option 3", nil, nil, nil, nil]
["Number", "Length", "Dimension", "Description", "Length", "Cost Per", "# Pieces", "Total", "Description", "Length", "Cost Per", "# Pieces", "Total", "Description", "Length", "Cost Per", "# Pieces", "Total"]
["Posts", nil, nil, "Cedar", nil, nil, nil, nil, "Cedar", nil, nil, nil, nil, "Pine", nil, nil, nil, nil]
["5", "27", "4x4", nil, "96", "$16.45", "1.41", "$23.13", nil, "96", "$16.45", "1.41", "$23.13", nil, "96", "$9.95", "1.41", "$13.99"]
["Sub Total", nil, nil, nil, nil, nil, nil, "$23.13", nil, nil, nil, nil, "$23.13", nil, nil, nil, nil, "$13.99"]
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
["Sides:", nil, nil, "Cedar 5/4\"", nil, nil, nil, nil, "Cedar 2\"", nil, nil, nil, nil, "Pine 2\"", nil, nil, nil, nil]
["4", "48", "? X 6", nil, "144", "$11.97", "1.33", "$15.96", nil, "96", "$12.55", "2.00", "$25.10", nil, "144", "$7.87", "1.33", "$10.49"]
["4", "72", "? X 6", nil, "144", "$11.97", "2.00", "$23.94", nil, "96", "$12.55", "3.00", "$37.65", nil, "144", "$7.87", "2.00", "$15.74"]
["4", "60", "? X 6", nil, "144", "$11.97", "1.67", "$19.95", nil, "96", "$12.55", "2.50", "$31.38", nil, "144", "$7.87", "1.67", "$13.12"]
["4", "36", "? X 6", nil, "144", "$11.97", "1.00", "$11.97", nil, "96", "$12.55", "1.50", "$18.83", nil, "144", "$7.87", "1.00", "$7.87"]
["4", "12", "? X 6", nil, "144", "$11.97", "0.33", "$3.99", nil, "96", "$12.55", "0.50", "$6.28", nil, "144", "$7.87", "0.33", "$2.62"]
["Sub Total", nil, nil, nil, nil, nil, nil, "$75.81", nil, nil, nil, nil, "$119.23", nil, nil, nil, nil, "$49.84"]
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
["Top:", nil, nil, "Cedar 5/4\"", nil, nil, nil, nil, "Cedar 5/4\"", nil, nil, nil, nil, "Pine 2\"", nil, nil, nil, nil]
["1", "48", "? X 6", nil, "144", "$11.97", "0.33", "$3.99", nil, "144", "$11.97", "0.33", "$3.99", nil, "144", "$7.87", "0.33", "$2.62"]
["1", "72", "? X 6", nil, "144", "$11.97", "0.50", "$5.99", nil, "144", "$11.97", "0.50", "$5.99", nil, "144", "$7.87", "0.50", "$3.94"]
["1", "60", "? X 6", nil, "144", "$11.97", "0.42", "$4.99", nil, "144", "$11.97", "0.42", "$4.99", nil, "144", "$7.87", "0.42", "$3.28"]
["1", "36", "? X 6", nil, "144", "$11.97", "0.25", "$2.99", nil, "144", "$11.97", "0.25", "$2.99", nil, "144", "$7.87", "0.25", "$1.97"]
["1", "12", "? X 6", nil, "144", "$11.97", "0.08", "$1.00", nil, "144", "$11.97", "0.08", "$1.00", nil, "144", "$7.87", "0.08", "$0.66"]
["Sub Total", nil, nil, nil, nil, nil, nil, "$18.95", nil, nil, nil, nil, "$18.95", nil, nil, nil, nil, "$12.46"]
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
["Grand Total", nil, nil, nil, nil, nil, nil, "$117.90", nil, nil, nil, nil, "$161.31", nil, nil, nil, nil, "$76.30"]
["For Four", nil, nil, nil, nil, nil, nil, "$471.58", nil, nil, nil, nil, "$645.24", nil, nil, nil, nil, "$305.19"]
=> nil
```

### YAML

```ruby
y = YAML.parse_file("data/yaml.yml").to_ruby
=> {"YAML"=>"YAML Ain't Markup Language",
 "What It Is"=>"YAML is a human friendly data serialization standard for all programming languages.",
 "YAML Resources"=>
  {"YAML 1.2 (3rd Edition)"=>"http://yaml.org/spec/1.2/spec.html",
   "YAML 1.1 (2nd Edition)"=>"http://yaml.org/spec/1.1/",
   "YAML 1.0 (1st Edition)"=>"http://yaml.org/spec/1.0/",
   "YAML Issues Page"=>"https://github.com/yaml/yaml/issues",
   "YAML Mailing List"=>"yaml-core@lists.sourceforge.net",
   "YAML IRC Channel"=>"#yaml on irc.freenode.net",
   "YAML Cookbook (Ruby)"=>"http://yaml4r.sourceforge.net/cookbook/ (local)",
   "YAML Reference Parser"=>"http://yaml.org/ypaste/"},
 "Projects"=>
  {"C/C++ Libraries"=>["libyaml", "Syck", "yaml-cpp"],
   "Ruby"=>["psych", "RbYaml", "yaml4r"],
   "Python"=>["PyYaml", "PySyck"],
   "Java"=>["JvYaml", "SnakeYAML", "YamlBeans", "JYaml"],
   "Perl Modules"=>["YAML", "YAML::XS", "YAML::Syck", "YAML::Tiny", "PlYaml"],
   "C#/.NET"=>["yaml-net", "yatools.net"],
   "PHP"=>["php-yaml", "syck", "spyc"],
   "OCaml"=>["ocaml-syck"],
   "Javascript"=>["JS-YAML", "JS-YAML Online# Browserified JS-YAML demo, to play with YAML in your browser."],
   "Actionscript"=>["as3yaml"],
   "Haskell"=>["YamlReference"],
   "Others"=>["yamlvim (src)"]},
 "Related Projects"=>["Rx", "Kwalify", "yaml_vim", "yatools.net", "JSON", "Pygments"],
 ...
```

# Decision Making in Ruby

