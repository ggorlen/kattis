local goal = {
    {"A", "B", "C", "D"},
    {"E", "F", "G", "H"},
    {"I", "J", "K", "L"},
    {"M", "N", "O", "."},
}
local grid = {}

for i = 1, 5 do
    grid[i] = io.read()
end

function manhattan_distance(x1, y1, x2, y2)
    return math.abs(x1 - x2) + math.abs(y1 - y2)
end

dist = 0

for i, row in ipairs(grid) do
    for j = 1, #row do
        local c = row:sub(j, j)

        if c ~= "." then
            for k = 1, #goal do
                for l = 1, #goal[k] do
                    if goal[k][l] == c then
                        dist = dist + manhattan_distance(i, j, k, l)
                        break
                    end
                end
            end
        end
    end
end

print(dist)
