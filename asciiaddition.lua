local ascii = [[xxxxx
x...x
x...x
x...x
x...x
x...x
xxxxx

....x
....x
....x
....x
....x
....x
....x

xxxxx
....x
....x
xxxxx
x....
x....
xxxxx

xxxxx
....x
....x
xxxxx
....x
....x
xxxxx

x...x
x...x
x...x
xxxxx
....x
....x
....x

xxxxx
x....
x....
xxxxx
....x
....x
xxxxx

xxxxx
x....
x....
xxxxx
x...x
x...x
xxxxx

xxxxx
....x
....x
....x
....x
....x
....x

xxxxx
x...x
x...x
xxxxx
x...x
x...x
xxxxx

xxxxx
x...x
x...x
xxxxx
....x
....x
xxxxx]]

local ascii_to_number = {}
local number_to_ascii = {}
local i = 0

for token in string.gmatch(ascii .. "\n\n", "(.-)\n\n") do
    ascii_to_number[token] = i
    number_to_ascii[tostring(i)] = token
    i = i + 1
end

local input = {}
for i = 0, 7 do
    table.insert(input, io.read())
end

local final_val_1 = ""
local final_val_2 = ""
local seen_plus = false
local val = {}
for i = 1, #input[1]+1 do
    local col = {}
    for j = 1, #input do
        table.insert(col, input[j]:sub(i, i))
    end
    table.insert(val, col)

    if #val == 6 or i == #input[1]+1 then
        table.remove(val, #val)
        local parsed = ""

        for i = 1, #val[1] do
            local section = ""
            for j = 1, #val do
                section = section .. val[j][i]
            end
            parsed = parsed .. section .. "\n"
        end

        parsed = parsed:match("^%s*(.-)%s*$")

        if ascii_to_number[parsed] == nil then
            seen_plus = true
        end

        if seen_plus and ascii_to_number[parsed] ~= nil then
            final_val_2 = final_val_2 .. ascii_to_number[parsed]
        elseif ascii_to_number[parsed] ~= nil then
            final_val_1 = final_val_1 .. ascii_to_number[parsed]
        end

        val = {}
    end
end

local total = tonumber(final_val_1) + tonumber(final_val_2)

for i = 1, 7 do
    local line = ""
    for digit in string.gmatch(total, ".") do
        local t = {}
        for r in string.gmatch(number_to_ascii[digit], "[^\n]+") do
            table.insert(t, r)
        end

        line = line .. t[i] .. "."
    end
    print(line:sub(1, -2))
end
