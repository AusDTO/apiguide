Batching restults
=================

If no limit is specified, return results with a default limit.

To get records 51 through 75 do this: 

http://example.gov/magazines?limit=25&offset=50

offset=50 means, ‘skip the first 50 records’

limit=25 means, ‘return a maximum of 25 records’

Information about record limits and total available count should also be included in the response. Example:

    {
        "metadata": {
            "resultset": {
                "count": 227,
		"offset": 25,
		"limit": 25
	    }
	},
	"results": [...]
    }


