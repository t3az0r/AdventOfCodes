-- day 03 task 2

io.input('input.txt')

house = {}
house[0] = {}
house[0][0] = 1

cx, cy = 0, 0
rcx, rcy = 0, 0
maxx, maxy = 0, 0
minx, miny = 0, 0

count = 0
while io.read(0) do
	ch = io.read(1)
	if count%2 == 0 then
		if ch == '>' then
			cx = cx +1
		elseif ch == '<' then
			cx = cx -1
		elseif ch == '^' then
			cy = cy +1
		elseif ch == 'v' then
			cy = cy -1
		end
		if cx > maxx then maxx = cx end
		if cy > maxy then maxy = cy end
		if cx < minx then minx = cx end
		if cy < miny then miny = cy end
		if not house[cx] then house[cx] = {} end
		if not house[cx][cy] then house[cx][cy] = 0 end
		house[cx][cy] = house[cx][cy] +1
	else
		if ch == '>' then
			rcx = rcx +1
		elseif ch == '<' then
			rcx = rcx -1
		elseif ch == '^' then
			rcy = rcy +1
		elseif ch == 'v' then
			rcy = rcy -1
		end
		if rcx > maxx then maxx = rcx end
		if rcy > maxy then maxy = rcy end
		if rcx < minx then minx = rcx end
		if rcy < miny then miny = rcy end
		if not house[rcx] then house[rcx] = {} end
		if not house[rcx][rcy] then house[rcx][rcy] = 0 end
		house[rcx][rcy] = house[rcx][rcy] +1
	end
	count = count +1
end
print("minx: " .. minx)
print("miny: " .. miny)
print("maxx: " .. maxx)
print("maxy: " .. maxy)

sum = 0
count = 0
-- print the lines
for ix=-80, 80 do
	for iy=-80,80 do
		if house[ix] and house[ix][iy] then
			print(ix, iy, house[ix][iy])
			count = count +1
			sum = sum + house[ix][iy]
		end
	end
end
print("count: " .. count)
print("sum: " .. sum)

