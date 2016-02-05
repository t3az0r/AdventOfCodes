-- day 05 task 2

io.input('input.txt')

count = 0
total = 0
for line in io.lines() do
	local is_nice = true

	-- rule 2: it contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa
	local k = string.len(line)
	local has_repeater = false
	for i=3,k do
		-- print(i, i-1)
		if string.sub(line, i-2, i-2) == string.sub(line, i, i) then has_repeater = true end 
	end
	if not has_repeater then is_nice = false end

	-- rule 1: it contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps)
	local has_double_pair = false
	for i=2,k do
		local pair = string.sub(line, i-1, i)
		_, ncount = string.gsub(line, pair, '__')
		if ncount >= 2 then has_double_pair = true end
	end
	if not has_double_pair then is_nice = false end

	if is_nice then
		print(line)
		count = count +1
	end
	total = total +1
end

print("count: " .. count)
print("total: " .. total)
