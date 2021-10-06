-- day 05 task 1

io.input('input8.txt')

count = 0
total = 0
 n_bs = 0
 n_dq = 0
 n_es = 0

for line in io.lines() do
    print(line .. "--" .. #line)
    total = total + #line

    local idx = 1
    local i, j = string.find(line, '\\\\', idx, true)
    while i and i > 0 and j and j < #line do
        print("bs", i, j)
        n_bs = n_bs +1
	idx = j+1
        i, j = string.find(line, '\\\\', idx, true)
    end

    local idx = 1
    local i, j = string.find(line, '\\\"', idx, true)
    while i and i > 0 and j and j < #line do
        print("dq", i, j)
        n_dq = n_dq +1
	idx = j+1
        i, j = string.find(line, '\\\"', idx, true)
    end

    local idx = 1
    local i, j = string.find(line, '\\x[0123456789abcdef][0123456789abcdef]', idx, false)
    while i and i > 0 and j and j < #line do
        print("es", i, j)
        n_es = n_es +1
	idx = j+1
        i, j = string.find(line, '\\x[01234567890abcdef][0123456789abcdef]', idx, false)
    end
--    if string.find(line, '\\\"', 1, true) then print ('dq') end
--[[
	for i=1,k do
		local ch = string.sub(line, i, i)
		if string.find(ch, '[aeiou]') then nvow = nvow +1 end
	end
--]]
    count = count +1
end

print("count: " .. count)
print("total: " .. total)
print(" n_bs: " ..  n_bs)
print(" n_dq: " ..  n_dq)
print(" n_es: " ..  n_es)

print(" calc: ", (total - 2*count - n_bs - n_dq - 3*n_es))
print("  qed: ", total - (total - 2*count - n_bs - n_dq - 3*n_es))

print(" 2qed: ", 4*count + 2*n_bs + 2*n_dq + n_es)
