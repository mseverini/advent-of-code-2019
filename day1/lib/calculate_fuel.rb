module RunIntcode
  INSTRUCTIONS = {
    1 => '+',
    2 => '*'
  }

  def self.find_output(output, program)
    (1...100).each do |noun|
      (1...100).each do |verb|
        program[1] = noun
        program[2] = verb
        return [noun, verb] if(run_program(program)[0] == output)
      end
    end
  end

  def self.run_program(program)
    mem_state = program.clone
    mem_state.each_slice(4) do |slice|
      return mem_state if slice[0] == 99

      mem_state[slice[3]] = mem_state[slice[1]].send(INSTRUCTIONS[slice[0]],mem_state[slice[2]])
    end
  end
end
