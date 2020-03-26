note
	description: "Goal is to show basic Polymorphism & Dynamic Binding implementation and use in Eiffel. This gave me trouble in the Labs when working with Encoding :?"
	author: "sid16"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SORT
feature -- Attribute
	sortedArray:ARRAY[INTEGER] -- Creating this attribute is useless b/c Eiffel is also Pass-by-Value, thus if pass it a reference, it will mutate the state of that object. Thus, you can test that object directly.
feature -- Constructor && Business Logic
	make(data:ARRAY[INTEGER])
	deferred end
end
