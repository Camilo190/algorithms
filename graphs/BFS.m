function resp = BFS_Count_Layer(G, init)
    queue = [init -1];
    visited = [init];
    layer = [0];
    layerCount = 1;
    while ~isempty(queue)
        v = queue(1);
        if v == -1
            layerCount = layerCount + 1;
            queue = [queue -1];
            if queue(2) == -1
                break;
            else
                queue = queue(2:end);
                continue;
            end
        end
        if length(queue) == 1
            queue = [];
        else
            queue = queue(2:end);
        end
        for i = 1:length(G{v})
            if (visited == G{v}(i)) == 0
                queue = [queue G{v}(i)];
                visited = [visited G{v}(i)];
                layer = [layer layerCount];
            end 
        end
    end
    resp = [visited ; layer];
end
