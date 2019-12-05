module CalculateFuel
  def self.calculate_for(masses)
    Array(masses).map{ |mass| calculate_module(mass) }.reduce(&:+)
  end

  def self.calculate_module(mass)
    fuel_required = calculate_fuel(mass)
    fuel_required <= 6 ? fuel_required : fuel_required  + calculate_module(fuel_required)
  end

  def self.calculate_fuel(mass)
    (((mass.to_f/3.0).floor) - 2)
  end
end
