local n, m = io.read():match("(%S+)%s+(%S+)")
n = tonumber(n)
m = tonumber(m)
local grid = {}

for i = 1, n do
    grid[i] = {}

    for e in io.read():gmatch("%S+") do
        table.insert(grid[i], tonumber(e))
    end
end

for i, row in ipairs(grid) do
    if i > 1 and i < #grid then
        for j = 2, (#row - 1) do
            local x = grid[i][j]

            if (
                grid[i-1][j] > x and
                grid[i+1][j] > x and
                grid[i][j-1] > x and
                grid[i][j+1] > x
            ) then
                print("Jebb")
                return
            end
        end
    end
end

print("Neibb")
