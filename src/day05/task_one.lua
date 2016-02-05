-- day 05 task 1

io.input('input.txt')

count = 0
total = 0
for line in io.lines() do
	local is_nice = true
	-- rule 3: it does not contain the strings ab, cd, pq, or xy
	if string.find(line, 'ab') then is_nice = false end
	if string.find(line, 'cd') then is_nice = false end
	if string.find(line, 'pq') then is_nice = false end
	if string.find(line, 'xy') then is_nice = false end

	-- rule 2: it contains at least one letter that appears twice in a row, like xx
	local k = string.len(line)
	local has_twin = false
	for i=2,k do
		-- print(i, i-1)
		if string.sub(line, i-1, i-1) == string.sub(line, i, i) then has_twin = true end 
	end
	if not has_twin then is_nice = false end

	-- rule 1: it contains at least three vowels (aeiou only)
	local nvow = 0
---[[
	 _, nvow = string.gsub(line, "[aeiou]", "")
--]]

--[[
	for i=1,k do
		local ch = string.sub(line, i, i)
		if string.find(ch, '[aeiou]') then nvow = nvow +1 end
	end
--]]
	if nvow < 3 then is_nice = false end

	if is_nice then
		print(line)
		count = count +1
	end
	total = total +1
end

print("count: " .. count)
print("total: " .. total)
