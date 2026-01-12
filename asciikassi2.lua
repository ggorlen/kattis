local n = io.read()
local top = string.rep(" ", n + 1) .. "x"

print(top)

for i = 1, n do
    print(string.rep(" ", n - i + 1) .. "/" .. string.rep(" ", i * 2 - 1) .. "\\")
end

print("x" .. string.rep(" ", n * 2 + 1) .. "x")

for i = 1, n do
    print(string.rep(" ", i) .. "\\" .. string.rep(" ", (1 + n * 2 - i * 2) ) .. "/")
end

print(top)
