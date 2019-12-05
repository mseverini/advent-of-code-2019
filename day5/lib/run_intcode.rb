class RunIntcode
  def initialize(program, input: nil)
    @program = program
    @input = input
    @output = nil
    @invalid_opcode = nil
  end
  INSTRUCTIONS_PARAMS = {
    1 => 3,
    2 => 3,
    3 => 1,
    4 => 1,
    5 => 2,
    6 => 2,
    7 => 3,
    8 => 3
  }

  def run_program
    pointer = 0
    until false
      instructions = @program[pointer].digits
      opcode = instructions.last
      # raise ArgumentError if @output && opcode != 9
      num_params = INSTRUCTIONS_PARAMS[opcode]
      modified_pointer = false
      case opcode
      when 1
        @program[@program[pointer+3]] = get_param(instructions[-3], @program[pointer+1]) + get_param(instructions[-4], @program[pointer+2])
      when 2
        @program[@program[pointer+3]] = get_param(instructions[-3], @program[pointer+1]) * get_param(instructions[-4], @program[pointer+2])
      when 3
        @program[@program[pointer+1]] = @input
      when 4
        @output = @program[@program[pointer+1]]
        @invalid_opcode = @program[pointer]
      when 5
        if(get_param(instructions[-3], @program[pointer+1]) != 0)
          modified_pointer = true
          pointer = get_param(instructions[-4], @program[pointer+2])
        end
      when 6
        if(get_param(instructions[-3], @program[pointer+1]) == 0)
          modified_pointer = true
          pointer = get_param(instructions[-4], @program[pointer+2])
        end
      when 7
        @program[@program[pointer+3]] = (get_param(instructions[-3], @program[pointer+1]) < get_param(instructions[-4], @program[pointer+2])) ? 1 : 0
      when 8
        @program[@program[pointer+3]] = (get_param(instructions[-3], @program[pointer+1]) == get_param(instructions[-4], @program[pointer+2])) ? 1 : 0
      when 9
        return @output
      end
      pointer += (num_params + 1) unless modified_pointer
    end
    @program
  end

  def get_param(mode, param)
    case mode
    when 0
      @program[param]
    when 1
      param
    else
      @program[param]
    end
  end
end

class Integer
  def digits
    self.to_s.chars.map(&:to_i)
  end
end
