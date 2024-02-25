-- Run time error. I have working Python code but I can't
-- figure out what's wrong with the Lua translation
local _, s, m = io.read():match("(%d+)%s+(%d+)%s+(%d+)")
s, m = tonumber(s), tonumber(m)

local t = {}
local visited = {}

for e in string.gmatch(io.read(), "[^%s]+") do
    t[#t + 1] = tonumber(e)
end

local steps = 0

while true do
    if s < 1 then
        result = "left"
        break
    elseif s > #t then
        result = "right"
        break
    elseif visited[s] then
        result = "cycle"
        break
    elseif t[s] == m then
        result = "magic"
        break
    end

    visited[s] = true
    steps = steps + 1
    s = s + t[s]
end

print(result)
print(steps)
