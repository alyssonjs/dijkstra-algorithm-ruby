def calculate_cost(origin_vertex, target_vertex, matrix)
    max_value = 9999
    cost = []
    adjacent = []
    closed_vertex = []

    matrix.each_with_index do |v, i|
        cost[i] = max_value
        adjacent[i] = -1
        closed_vertex[i] = false
    end

    cost[origin_vertex] = 0
    adjacent[origin_vertex] = -1
    closed_vertex[origin_vertex] = true

    current_vertex = origin_vertex

    until current_vertex == target_vertex
        matrix.each_with_index do |v, i|
            if matrix[current_vertex][i] != 0 && closed_vertex[i] != true
                if cost[current_vertex] + matrix[current_vertex][i] < cost[i]
                    adjacent[i] = current_vertex
                    cost[i] = cost[current_vertex] + matrix[current_vertex][i]
                end
            end
        end
        max_value = 9999
        matrix.each_with_index do |v, i|
            if closed_vertex[i] == false && cost[i] < max_value
                max_value = cost[i]
                current_vertex = i
            end
        end
        closed_vertex[current_vertex] = true
    end

    print_values(current_vertex, target_vertex, cost, adjacent)
end

def print_values(current_vertex, target_vertex, cost, adjacent)

    print "Vertex, Cost, Path -> #{target_vertex}, #{cost[target_vertex]}, " 

    current_vertex = target_vertex
    k = 0
    values = []

    until current_vertex == -1
        values[k] = current_vertex
        current_vertex = adjacent[current_vertex]
        k += 1
    end

    for i in (0..values.size-2)
        k -= 1
        print "#{values[k]} - "
    end

    k -= 1
    print "#{values[k]}"
    puts "\n\n\n"
    
end