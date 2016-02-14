-- day 06 task one

-- init arrays
light = {}
for x=0,999 do
  light[x] = {}
  for y=0,999 do
    light[x][y] = 0
  end
end

-- test
-- print(light[500][500])

io.input('input.txt')
line_count = 0
for line in io.lines() do
    line_count = line_count +1
	-- parse coordinates
	tuple_pattern = "%d+,%d+"
	split_pattern = "through"
	split_index = string.find(line, split_pattern)
	start_tuple = string.sub(line, string.find(line, tuple_pattern))
	end_tuple = string.sub(line, string.find(line, tuple_pattern, split_index))
--	print(start_tuple, end_tuple)
	split_pattern = ","
	split_index = string.find(start_tuple, split_pattern)
	x1 = tonumber(string.sub(start_tuple, string.find(start_tuple, "%d+")))
	y1 = tonumber(string.sub(start_tuple, string.find(start_tuple, "%d+", split_index)))
	split_index = string.find(end_tuple, split_pattern)
	x2 = tonumber(string.sub(end_tuple, string.find(end_tuple, "%d+")))
	y2 = tonumber(string.sub(end_tuple, string.find(end_tuple, "%d+", split_index)))
-- 	print(x1, y1, x2, y2)
	-- swap if needed
	if x1 > x2 then x1, x2 = x2, x1 end
	if y1 > y2 then y1, y2 = y2, y1 end
--	print(x1, y1, x2, y2)
	-- parse operation
    if string.find(line, 'turn on') then
		for x=x1,x2 do
			for y=y1,y2 do
				light[x][y] = 1
			end
		end
	elseif string.find(line, 'turn off') then
		for x=x1,x2 do
			for y=y1,y2 do
				light[x][y] = 0
			end
		end
	elseif string.find(line, 'toggle') then
		for x=x1,x2 do
			for y=y1,y2 do
				if light[x][y] == 0 then light[x][y] = 1
				elseif light[x][y] == 1 then light[x][y] = 0
				else print('error in line', line_count)
				end
			end
		end
	else
	    print('unknown command in line ', line_count)
	end
end



-- count lights
count = 0
for x=0,999 do
  for y=0,999 do
    if light[x][y] == 1 then count = count+1 end
  end
end
print('total lights on: ', count)
