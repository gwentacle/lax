Lax.test(obj: 1) {|that|
  that.calling(:/).with(0).raises ZeroDivisionError
  that.calling(:**) {|exponentiation|
    exponentiation.with(1).satisfies {|n|n==1}
    exponentiation.with(2).satisfies ->(n){n==1}
  }
}

Lax.test { |assert|
  assert.calling(:/).on(1).with(0).raises ZeroDivisionError
  assert.returns(1) { |assert_equal_to_one|
    assert_equal_to_one.on(0).calling(:+).with 1
    assert_equal_to_one.on(1) {|identity_on_one|
      identity_on_one.calling(:* ).with 1
      identity_on_one.calling(:**).with 2
      identity_on_one.calling(:+ ).with 0
    }
  }
}

Lax.test(msg: :object_id) {|id|
  id.satisfies(->(v){Fixnum===v}) {|_|
    _.on 1
    _.on 'asdf'
    _.on String
    _.on Lax
    _.calling(:size).on([1,2,3])
  }
}

Lax.test(obj: 222) {|that|
  that.it.returns 222
}

