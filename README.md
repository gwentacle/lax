Stilts
------
A bright smidgen of a testing framework with the right amount of wobble.
```ruby
  Stilts.test { |assert|
    assert.calling(:/).on(1).with(0).raises ZeroDivisionError

    assert.satisfies(->(n) { n == 1 }) { |returns_one|
      returns_one.calling(:+).on(0).with 1

      returns_one.on(1) { |id_on_one|
        id_on_one.calling(:+).with 0
        id_on_one.calling(:*).with 1
        0.upto(10) { |n|
          id_on_one.calling(:**).with n
        }
      }
    }
  }
  Stilts.go
```

Features
========
* Everything about a test is scopeable - methods, arguments, receivers, blocks, expectations, hooks, and any metadata you might care to attach. Testing that one method call satisfies three conditions is as natural as testing that one condition is satisfied by three different method calls.
* No hardcoded constraints on terminal output, handling of failed tests, w/e - it's all done with user-configurable hooks.
* Built-in Rake task helper that will Make It Do It in about 60 seconds.
* Built-in support for concurrent testing.
* Code footprint so small, it's hardly there at all (< 200 SLOC).
* Does not pollute your toplevel namespace or infect the entire Ruby object hierarchy with with its code.

