require 'csv'
module FindPassword
  def self.in_range(range)
    range.map{ |passord| is_valid?(passord) }.count(true)
  end

  def self.is_valid?(password)
    has_duplicate = false
    digits = password.to_s.chars.map(&:to_i)
    digits.each_with_index do |val, index|
      return false if val > (digits[index+1] || 10)
        if (val == digits[index-1] && val != digits[index+1] && val != digits[index-2])
        has_duplicate = true
      end
    end
    has_duplicate
  end
end
