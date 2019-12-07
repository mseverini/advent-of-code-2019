class Orbits
  def initialize(input)
    build_graph(input)
  end

  def num_orbits
    orbits = 0
    @graph.keys.each {|point| orbits += walk_graph(point).length}
    orbits
  end

  def find_between(point1, point2)
    path1 = walk_graph(point1)
    path2 = walk_graph(point2)
    (path1 & path2).map{ |intersection| path1.index(intersection) + path2.index(intersection) - 2}.min
  end

  def walk_graph(point)
    path = []
    until point == "COM"
      path << point
      point = @graph[point]
    end
    path
  end

  def build_graph(input)
    @graph = {}
    input.each do |orbit|
      barycenter, satilite = orbit.split(")")
      @graph[satilite] = barycenter
    end

  end
end
