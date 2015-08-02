Batching results
================

If no limit is specified, return results with a default limit.

To get records 51 through 75 do this: 

.. sourcecode:: http

   GET /magazines?limit=25&offset=50 HTTP/1.1 
   Host: example.gov.au
   Accept: application/json, text/javascript


offset=50 means, ‘skip the first 50 records’

limit=25 means, ‘return a maximum of 25 records’

Information about record limits and total available count should also be included in the response. Example:


.. sourcecode:: http

   HTTP/1.1 200 OK
   Vary: Accept
   Content-Type: text/javascript

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

