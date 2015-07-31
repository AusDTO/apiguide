Use HTTP methods and status codes
=================================

HTTP methods and status codes should be used in compliance with their definitions under the HTTP/1.1 standard.

 * The action taken on the representation will be contextual to the media type being worked on and its current state.
 * Receiving meaningful status codes helps consumers better consume your API.


.. Table 1: Example of HTTP methods  and response status codes

.. table:: Example of HTTP methods  and response status codes

+--------+
| METHOD |
+========+
resource: /magazines (collection)
resource: /magazines/1234 (individual)

Effect of method
Response status code
Effect of method
Response status code
POST
Create new magazine within the /magazines resource
201 (Created), indicating that the request has been fulfilled. The URI of the new resource is provided in the response
No effect. Can't create a resource that already exists
405 (Method Not Allowed), indicating that you can't create a resource that already exists
GET
List all magazines contained within the /magazines resource
200 (OK), indicating that the request has succeeded.
Show the /magazines/1234 resource
200 (OK), indicating that the request has succeeded.
PUT
Replace all magazines in the /magazines resource with those in the request
200 (OK), indicating that the request has succeeded.
Replace the /magazines/1234 resource with the representation in the request
200 (OK), indicating that the request has succeeded.
DELETE
Delete all magazines from the /magazines resource
200 (OK), indicating that the request has succeeded.
Delete the resource /magazines/1234
200 (OK), indicating that the request has succeeded.
HEAD
List metadata about the /magazines resource, such as last-modified-date
200 (OK), indicating that the request has succeeded.
List metadata about /magazines/1234, such as last-modified-date
200 (OK), indicating that the request has succeeded.



HTTP response principles

No values in keys – for example, {"125": "Environment"} is bad, {"id": "125", "name": "Environment"} is good.

No internal-specific names (for example, "node" and "taxonomy term")

Metadata should only contain direct properties of the response set, not properties of the members of the response set

Provide error responses

Error responses should be as descriptive and specific as possible. They should also include a message for the end-user (when appropriate), internal error code (corresponding to some specific internally determined ID) and links where developers can find more information. For example:

    {
      "developerMessage" : "Verbose, plain language description of the problem. Provide developers
       suggestions about how to solve their problems here",
      "userMessage" : "This is a message that can be passed along to end-users, if needed.",
      "errorCode" : "444444",
      "moreInfo" : "http://api.example.gov/v1/documentation/errors/444444.html"
    }


