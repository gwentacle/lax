@array = []

Lax.test(obj: @array) {|that|
  that.before {@array << 1}.calling(:size) {|_|
    _.returns 1
    _.returns 2
    _.after {@array.shift}.returns 3
    _.returns 3
  }
}

