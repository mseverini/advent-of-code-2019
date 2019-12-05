require 'csv'
module FindIntersections
  def self.closest(tangle)
    all_intersections(CSV.parse(tangle)).
      map { |intersection| find_distance(intersection) }.min
  end

  def self.shortest_path(tangle)
    steps_to_intersections(CSV.parse(tangle)).min
  end

  def self.steps_to_intersections(tangle)
    graph_1 = draw_graph(tangle[0])
    graph_2 = draw_graph(tangle[1])
    (graph_1 & graph_2).map do |intersection|
      graph_1.index(intersection) + graph_2.index(intersection) + 2
    end
  end

  def self.find_distance(intersection)
    intersection.map(&:abs).reduce(&:+)
  end

  def self.all_intersections(tangle)
    draw_graph(tangle[0]) & draw_graph(tangle[1])
  end

  def self.draw_graph(wire)
    points = [[0,0]]
    wire.each do |line|
      line[1..-1].to_i.times do
        points.push next_point(line[0], points.last)
      end
    end

    points[1..-1]
  end

  def self.next_point(direction, last_point)
    case direction
    when 'U'
      [last_point[0]+1, last_point[1]]
    when 'D'
      [last_point[0]-1, last_point[1]]
    when 'L'
      [last_point[0], last_point[1]-1]
    when 'R'
      [last_point[0], last_point[1]+1]
    end
  end
end
