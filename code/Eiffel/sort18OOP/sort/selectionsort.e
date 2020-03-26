note
	description: "Summary description for {SELECTIONSORT}."
	author: "sid16"
	date: "$Date$"
	revision: "$Revision$"

class
	SELECTIONSORT
inherit
	SORT
create
	make
feature	-- Constructor & Business logic
	make(data:ARRAY[INTEGER])
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
			--Set attribute to sorted data array
					sortedarray := data
		end
end
