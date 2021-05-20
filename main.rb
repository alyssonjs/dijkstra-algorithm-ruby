require './base.rb'
require './dijkstra.rb'

matrix = get_base

origin_vertex = 0

(1..matrix.size).each do |i|
    target_vertex = i
    calculate_cost(origin_vertex, target_vertex, matrix) if target_vertex.between?(1, matrix.size-1)
end
