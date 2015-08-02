Mock behaviour
==============

It is suggested that each resource accept a 'mock' parameter on the testing server. Passing this parameter should return a mock data response (bypassing the back-end).

Implementing this feature early in development ensures that the API will exhibit consistent behaviour, supporting a test-driven development methodology.

Mock features compliment interface specification documents, facilitating development of applications that reuse an API. When supplying client libraries or reference implementations for use with an API, mocking features can be implemented at that layer as an alternative to the API itself.


Example 1 - GET mock list of magazines
--------------------------------------

**Request mock list of magazines**

.. sourcecode:: http

   GET /api/v1/magazines.json?mock=True HTTP/1.1
   Host: example.gov.au
   Accept: application/json, text/javascript


**Response list of mock magazines**

.. sourcecode:: http

   HTTP/1.1 200 OK
   Vary: Accept
   Content-Type: text/javascript

   {
     "metadata": {
       "resultset": {
         "count": 123,
	 "offset": 0,
	 "limit": 10
       }
     },
     "results": [
       {
         "id": "1234",
	 "type": "magazine",
	 "title": "Public Water Systems",
	 "tags": [
           {"id": "125", "name": "Environment", “url”: “http://api.example.gov.au/v1/tags/125”},
           {"id": "834", "name": "Water Quality"}
	 ],
	 "created": "1231621302"
       },
       {
         "id": 2351,
	 "type": "magazine",
	 "title": "Public Schools",
	 "tags": [
           {"id": "125", "name": "Elementary"},
	   {"id": "834", "name": "Charter Schools"}
	 ],
	 "created": "126251302"
       }
     ]
   }


Example 2 - GET individual mock magazine
----------------------------------------

**Request mock magazine**

.. sourcecode:: http

   GET /api/v1/magazines/1234?format=json&mock=True HTTP/1.1
   Host: example.gov.au
   Accept: application/json, text/javascript


**Response mock magazine**

.. sourcecode:: http

   HTTP/1.1 200 OK
   Vary: Accept
   Content-Type: text/javascript

   {
     "id": "1234",
     "type": "magazine",
     "title": "Public Water Systems",
     "tags": [
       {"id": "125", "name": "Environment"},
       {"id": "834", "name": "Water Quality"}
     ],
     "created": "1231621302"
   }


Example 3 - POST article to mock magazine
-----------------------------------------

**Post an article to mock magazine 1234**

.. sourcecode:: http

   POST /api/v1/magazines/1234/articles?mock=True HTTP/1.1
   Host: example.gov.au
   Accept: application/json, text/javascript

   {
     "title": "Raising Revenue",
     "author_first_name": "Jane",
     "author_last_name": "Smith",
     "author_email": "jane.smith@example.gov",
     "date": "2014-06-22",
     "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ante ut augue..."
   }


.. note::

   This method would not result in an article being posted, it is only a simulation.

