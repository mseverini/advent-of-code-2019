class RunIntcode
  def initialize(program, input: nil)
    @program = program
    @input = input
    @output = nil
    @invalid_opcode = nil
    @pointer = 0
  end

  INSTRUCTIONS = {
    1 => 'add',
    2 => 'multiply',
    3 => 'write_input',
    4 => 'output',
    5 => 'jump_if_true',
    6 => 'jump_if_false',
    7 => 'less_than',
    8 => 'equal_to',
    99 => 'skip'
  }

  def run_program
    opcode = 0
    until opcode == 99
      instructions = @program[@pointer].digits
      opcode = instructions.last(2).join.to_i
      @modes = instructions[0...-2]
      self.send(INSTRUCTIONS[opcode])
    end
    @output
  end

  def add
    set(3, param(1) + param(2))
    move_pointer_by(4)
  end

  def multiply
    set(3, param(1) * param(2))
    move_pointer_by(4)
  end

  def write_input
    set(1, @input)
    move_pointer_by(2)
  end

  def output
    @output = param(1)
    move_pointer_by(2)
  end

  def jump_if_true
    param(1) != 0 ? move_pointer_to(param(2)): move_pointer_by(3)
  end

  def jump_if_false
    param(1) == 0 ? move_pointer_to(param(2)): move_pointer_by(3)
  end

  def skip
  end

  def less_than
    set(3, (param(1) < param(2)) ? 1 : 0)
    move_pointer_by(4)
  end

  def equal_to
    set(3, (param(1) == param(2)) ? 1 : 0)
    move_pointer_by(4)
  end

  def move_pointer_by(distance)
    @pointer += distance
  end

  def move_pointer_to(location)
    @pointer = location
  end

  def param(position)
    param = @program[@pointer + position]
    @modes[-position] == 1 ? param : @program[param]
  end

  def set(position, value)
    @program[@program[@pointer+position]] = value
  end
end

class Integer
  def digits
    self.to_s.chars.map(&:to_i)
  end
end
