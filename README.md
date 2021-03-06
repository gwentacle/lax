lax
===
Lax is an insouciant smidgen of a testing library that aims for minimal visibility. It has no special file structure, no irksomely sophisticated DSL, and no particular philosophical agenda. It is currently under 100 significant lines of code (and shrinking), with no non-core dependencies. Here is how you use it:
```ruby
# lax offers basically four ways to test things.
# method zero (the degenerate method): direct truthiness testing
test 1.even? # fail, but with a not-so-helpful error message

# method one: test zero-arity method calls for truthiness
test 1,  :even?  # fail, with a better error message than ^^
test [], :empty? # pass

# method two: use matchers
test "test".upcase, equals("TEST") 

# defining your own matchers is easy
Lax.matcher :at_least_n_words do |n, string|
  string.split.size >= n or fail_with "this test totes failed"
end

test "oh wow lol", at_least_n_words(3) # pass

# matchers are curried procs bound to methods, so you can do things like:
sum_to = ->(n) { returns n, :reduce, :+, nil } # returns is a built-in matcher
test [10, 5, 0], sum_to[15]                    # pass

# method three: specify return values of zero-arity method calls with a hash
# (all three tests in this example are executed independently)
test Array.new(6, 7),
  class:  Array, # pass
  size:   9,     # fail
  empty?: false  # pass

# any number of tests of any type can be included in a test:
# (truthiness testing just uses the built-in matcher 'truthy')
test -2,
  truthy,
  equals(-2.0),
  :even?,
  abs: 2
```
how come lax is neat
--------------------
* Way fast setup
* Tiny & hackable
* No legalese or complicated DSL
* Output is trivial to customize
* Does not work by infecting the entire object system with its code - neighbourly!

how to run lax with rake
------------------------
```ruby
# Rakefile
require 'lax'
task(:lax) { Lax.run Dir['./my/test/directory/*.rb'] }
# boom done start hacking
```

license
-------
MIT/X11. See LICENSE for details.

