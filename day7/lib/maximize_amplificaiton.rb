require 'run_intcode'
require 'amp_array'
class MaximizeAmplificaiton
  def self.maximize(program)
    [0,1,2,3,4].permutation.map do |signal|
      AmpArray.new(program,signal).run_array
    end.max
  end

  def self.maximize_with_feedback(program)
    [9,8,7,6,5].permutation.map do |signal|
      array = AmpArray.new(program,signal)
      array.run_array until array.halted
      array.output
    end.max
  end
end
