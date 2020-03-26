note
	description: "Summary description for {INSERTIONSORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INSERTIONSORT
inherit
	SORT
create
	make
feature	-- Constructor & Business logic
	make(data:ARRAY[INTEGER])
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
			--Set attribute to sorted data array
			sortedarray := data
		end
end
