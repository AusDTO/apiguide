Use HTTP methods and status codes
=================================

Meaningful status codes helps consumers utilise your API.

.. should::

   HTTP methods and status codes should be used in compliance with their definitions under the HTTP/1.1 standard.


.. the following statement is clear to me, but needs better explanation.

The action taken on the representation will be contextual to the media type being worked on and its current state.


Examples
--------

.. http:get:: /magazines

   List all magazines contained within the /magazines resource
   
   .. sourcecode:: http
   
      GET /magazines HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript
   
   A response of "200 OK" indicating that the request has succeeded.
   
   .. sourcecode:: http
   
      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript

      {...}

   :statuscode 200: no error
   :statuscode 404: the "magazines" resource does not exist


.. http:post:: /magazines

   Create new magazine within the /magazines resource
		    
   .. sourcecode:: http

      POST /magazines HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript

      {...}
   
   A response of "201 Created" indicates that the request has been fulfilled.

   The URI of the new resource is provided in the response

   .. sourcecode:: http

      HTTP/1.1 201 Created 
      Vary: Accept
      Content-Type: text/javascript
     
      { "id": "1234" }


   However, no effect if the resource already exists.

   .. sourcecode:: http

      HTTP/1.1 405 Method Not Allowed
      Vary: Accept
      Content-Type: text/javascript

      {
        "developerMessage" : "Unable to create a magazine with ID of 1234 because a magazine with that ID already exists",
	"userMessage" : "Unable to create duplicate magazine 1234",
	"errorCode" : "444444",
	"moreInfo" : "http://api.example.gov/v1/documentation/errors/444444.html"
      }
   
   :statuscode 201: magazine created
   :statuscode 405: unable to create "magazine" resource


.. http:put:: /magazines

   Replace all magazines in the /magazines resource with those in the request
		    
   .. sourcecode:: http

      PUT /magazines HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript

      [ ... ]
   
   200 indicates that the request has succeeded.

   .. sourcecode:: http

      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript
     
      { "id": "1234" }

   :statuscode 200: magazines replaced



.. http:put:: /magazines/1234

   Replace the /magazines/1234 resource with the representation in the request
		    
   .. sourcecode:: http

      PUT /magazines/1234 HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript

      [ ... ]
   
   200 indicates that the request has succeeded.

   .. sourcecode:: http

      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript
     
      { "id": "1234" }

   :statuscode 200: magazine 1234 replaced


.. http:delete:: /magazines

   Delete all magazines from the /magazines resource

   .. sourcecode:: http

      DELETE /magazines HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript
   
   200 indicates that the request has succeeded.

   .. sourcecode:: http

      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript
     
      { "id": "1234" }

   :statuscode 200: all magazines deleted


.. http:delete:: /magazines/1234

   Delete the magazine resource /magazines/1234

   .. sourcecode:: http

      DELETE /magazines/1234 HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript
   
   200 indicates that the request has succeeded.

   .. sourcecode:: http

      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript
     

   :statuscode 200: magazine 1234 deleted


.. http:head:: /magazines

   List metadata about the /magazines resource, such as last-modified-date.
   
   .. sourcecode:: http
   
      HEAD /magazines HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript
   
   200 indicates that the request has succeeded.
   
   .. sourcecode:: http
   
      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript
     
      {...}
   
   :statuscode 200: magazines metadata found 

.. http:head:: /magazines/1234
 
   List metadata about /magazines/1234, such as last-modified-date.
   
   .. sourcecode:: http
   
      HEAD /magazines HTTP/1.1
      Host: example.gov.au
      Accept: application/json, text/javascript
   
   200 indicates that the request has succeeded.
   
   .. sourcecode:: http
   
      HTTP/1.1 200 OK
      Vary: Accept
      Content-Type: text/javascript
     
      {...}
   
   :statuscode 200: metadata about magazine 1234 found 



HTTP response principles
------------------------

No values in keys – for example, {“125”: “Environment”} is bad, {“id”: “125”, “name”: “Environment”} is good. Note that in the first (bad) example, the key is "125" and the value is "Environment". This is a problem because the key is supposed to be the name of the value. In the second example (good) the keys are descriptions of their coresponding values.

No internal-specific names (for example, "node" and "taxonomy term")

Metadata should only contain direct properties of the response set, not properties of the members of the response set


Provide error responses
-----------------------

Error responses should be as descriptive and specific as possible. They should also include a message for the end-user (when appropriate), internal error code (corresponding to some specific internally determined ID) and links where developers can find more information. For example:


.. sourcecode:: json

   {
     "developerMessage" : "Verbose, plain language description of the problem.
		Provide developers suggestions about how to solve their problems here",
     "userMessage" : "This is a message that can be passed along to end-users, if needed.",
     "errorCode" : "444444",
     "moreInfo" : "http://api.example.gov/v1/documentation/errors/444444.html"
   }



