before = proc {sleep 0.01}
cases = Stilts::Tree.new.tap {|tree|
  1.upto(100) do |n|
    tree.on(n).it.returns n
  end
}.cases

Stilts.test(Stilts::Runner.new(cases, threads: 100, before: before)) {|that|
  that.calling(:go).satisfies {|runner|
    runner.cases.size == 100 and
    runner.cases.all? {|c| c[:pass]}
  }
}

