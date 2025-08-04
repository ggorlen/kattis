local n = io.read()
local top = "+" .. string.rep("-", n) .. "+"
local row = "|" .. string.rep(" ", n) .. "|\n"
print(top .. "\n" .. string.rep(row, n) .. top)
