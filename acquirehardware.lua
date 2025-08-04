local r, c = io.read():match("(%S+)%s+(%S+)")
r = tonumber(r)
c = tonumber(c)
local grid = {}

for i = 1, r do
    grid[i] = {}

    for e in io.read():gmatch("%S") do
        table.insert(grid[i], e)
    end
end

function search(i, j, memo)
    if i > r or j > c then
        return 0
    end

    local key = i .. " " .. j

    if memo[key] ~= nil then
        return memo[key]
    end

    local value = 0
    if grid[i][j] == "I" then
        value = 1
    end

    if r == i and j == c then
        return value
    end

    local x = math.max(
        value + search(i + 1, j, memo),
        value + search(i, j + 1, memo)
    )
    memo[key] = x
    return memo[key]
end

print(search(1, 1, {}))
