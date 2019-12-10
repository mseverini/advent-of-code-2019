class AmpArray
  def initialize(program, phases)
    @program = program
    @amps = phases.map {|phase| RunIntcode.new(program, input: [phase]) }
    @last_output = 0
  end

  def run_array
    @amps.each do |amp|
      @last_output = run_with_input(amp, @last_output)
    end
    @last_output
  end

  def output
    @last_output
  end

  def halted
    @amps.any?(&:halted)
  end

  def run_with_input(computer, input)
    computer.input << input
    computer.run_program
  end
end
