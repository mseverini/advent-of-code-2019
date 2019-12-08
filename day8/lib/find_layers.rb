class FindLayers
  def initialize(input)
    @layers = input.digits.each_slice(25*6).map{|e| e}
    @image = @layers[0]
  end

  def calculate_image
    image = @layers[0]
    @layers.each do |layer|
      image.zip(layer).each_with_index do |pair, index|
        image[index] = pair[1] if pair[0] == 2
      end
    end

    image.map!{|x| x==1 ? "◻️" : "◾️"}
    image.each_slice(25).to_a.each { |x| puts x.join(" ")}
  end
end

class String
  def digits
    self.chars.map(&:to_i)
  end
end
