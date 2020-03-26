note
	description: "I struggled with encoding and dynamic binding in Eiffel. This is a how-to!"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ES_SUITE

create
	make

feature {NONE} -- Initialization

	make
		do
			print ("Hello Eiffel World!%N")
			add_test (create {TESTS_SORT}.make)
			show_browser
			run_espec
		end

end
