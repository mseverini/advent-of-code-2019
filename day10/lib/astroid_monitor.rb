require 'matrix'
class AstroidMonitor
  def initialize(map)
    @map = map.split("\n").map(&:chars)
    @astroid_view = {}
  end

  def find_astroid
    all_astroids.each do |astroid|
      count_view(astroid)
    end

    astroid_view.values.max
  end

  def find_vaporized(position)
    angle = angles(position).sort{|a,b| b<=>a}[199]
    all_astroids.select{|loc| angle(position,loc) == angle}
  end

  def all_astroids
    astroid_view.keys
  end

  def astroid_view
    if @astroid_view.empty?
      (0...@map.length).each do |i|
        (0...@map[0].length).each do |j|
          @astroid_view[[i,j]] = 0 if @map[i][j] == "#"
        end
      end
    end
    @astroid_view
  end

  def count_view(astroid)
   astroid_view[astroid] = angles(astroid).length
  end

  def angles(astroid)
    astroid_view[astroid] = astroid_view.keys
      .reject{ |loc| loc == astroid }
      .map{|loc| angle(astroid, loc) }.uniq
  end

  def angle(a, b)
    Math.atan2(b[1]-a[1], b[0]-a[0])
  end
end

