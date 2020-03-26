note
	description: "sort18 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			array: ARRAY [INTEGER]
		do
			array := <<8, 1, 6, 10, 3, 0, 14, 5, 6, 3, 1, 2, 3, 4, 6, 7, 2>>
			heapsort (array)
			print (array)
		end

feature --Sorting alogs

	insertionSort (data: ARRAY [INTEGER]) --void i.e. this procedure is a command- it does not return anything.
		local
			n, i, j, currentE, buffer: INTEGER
		do
				--Stragtegy: walk up and compare down.
			n := data.count
			from
				i := 2
			until
				i > n
			loop
				currente := data.at (i)
				j := i
				from
				until
					j = 1 or data.at (j) > data.at (j - 1)
				loop
						--Approach 1:
						--Note: This approach yeilds logically incorrect functionally.
						--Eventhough syntatically its corrects and complis w/o errors.

						--data[j] = data[j-1]
						--j := j-1

						--Why?
						--Strictly my opinion based off intuition, Eiffel is old.
						--Thus, to it data[j] = data[j-1] does not have the same meaning as in Java.
						--Think about it...

						--Approach 2:
					buffer := data.at (j)
					data.put (data.at (j - 1), j)
					data.put (buffer, j - 1)
					j := j - 1
				end
				data.put (currentE, j)
				i := i + 1
			end
		end

	selectionSort (data: ARRAY [INTEGER])
		local
			i, j, minI, buffer, n: INTEGER
		do --Strategy: walk up and find min
			n := data.count
			from
				i := 1
			until
				i > n - 1
			loop
				minI := i
				j := i
				from
				until
					j > n
				loop
					if data.at (minI) > data.at (j) then
						minI := j
					end
					j := j + 1
				end
				buffer := data.at (i)
				data.put (data.at (minI), i)
				data.put (buffer, minI)
				i := i + 1
			end
		end

	heapsort (data: ARRAY [INTEGER])
		local
			n, j, buffer: INTEGER
			i: REAL_64
		do
				--Strategy: Build-heap and add max by walking down.
			n := data.count

				--Build heap from array input
			from --index starts at 1!
				i := (n / 2)
			until
				i.floor < 1
			loop
				heapify (data, n, i.floor)
				i := i.floor
				i := i - 1
			end

				--add max by walking down
			from
				j := n
			until
				j < 1
			loop
				buffer := data.at (1)
				data.put (data.at (j), 1)
				data.put (buffer, j)
				heapify (data, j, 1)
				j := j - 1
			end
		end

	heapify (data: ARRAY [INTEGER]; n, index: INTEGER)
		local
			largest, buffer: INTEGER
		do
			largest := index
				--Be careful about i <= n!
			if 2 * index < n and data.at (2 * index) > data.at (largest) then
				largest := 2 * index
			end
			if 2 * index + 1 < n and data.at (2 * index + 1) > data.at (largest) then
				largest := 2 * index + 1
			end
			if index /= largest then
				buffer := data.at (index)
				data.put (data.at (largest), index)
				data.put (buffer, largest)
				heapify (data, n, largest)
			end
		end

end
