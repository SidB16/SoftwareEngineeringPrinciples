note
	description: "Summary description for {TESTS_SORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TESTS_SORT

inherit
	ES_TEST
create
	make
feature	-- Constructor, used to collect all unit tests.
	make
	do
		add_boolean_case (agent testone)
	end
feature -- Unit tests
	testone:BOOLEAN
	local
		array:ARRAY[INTEGER]
		sorter:SORT
		peice:INTEGER --Encoding variable (This is critical for Labs!)
	do
		comment ("Test One: Testing Mutitple Sorting Algos via Dynamic Binding technique")

		peice := 2 -- Encoder value set here (This is critical for Labs!)

		array := <<8, 1, 5, 4, 3, 6, 9, 0>>

		if peice = 1 then -- notice no brackets is OKAY :p
			create {INSERTIONSORT}sorter.make(array) -- Dynamic Binding
		else
			create {SELECTIONSORT}sorter.make(array) 
		end --heapsort and quicksort comming soon.... :P

		Result:= sorter.sortedarray ~ <<0, 1, 3, 4, 5, 6, 8, 9>> --sorter.sortedarray.at (1) = 1 and sorter.sortedarray.at (2) = 8

		check Result end --Helps with "catching error" i.e. not showing red bar

	end
end
