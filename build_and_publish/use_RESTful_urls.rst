Use RESTful service URLs
^^^^^^^^^^^^^^^^^^^^^^^^

Under REST principles, a URL identifies a resource. The following URL design patterns are considered REST best practices:

 * URLs should include nouns, not verbs.
 * Use plural nouns only for consistency (no singular nouns).
 * Use HTTP methods (HTTP/1.1) to operate on these resources:
 * Use HTTP response status codes to represent the outcome of operations on resources.


.. should::

   Agencies should consistently apply RESTful design patterns for API URLs.


Versioning
----------

Example of an API URL that contains a version number:

.. sourcecode:: http

   GET /v1/path/to/resource HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript

.. may::

   An API URL may contain a version number.


See `versioning`_ for more details.

.. should::

   If an API URL does not contain a version number (anonymous version), then it should be understood that it always refers to the latest version.


.. should_not::
   
   Anonymous API versions should not be considered stable, because the latest version changes with each release.


.. was "Don’t accept any requests that do not specify a version number."


Formats
-------

Allow users to request formats like JSON or XML, for example: 

 * http://example.gov/api/v1/magazines.json
 * http://example.gov/api/v1/magazines.xml

.. see #25


URL Depth
---------

The resource/identifier/resource URL pattern is sufficient for full *attribute visibility*
between any resources. Therefor, this URL depth is usually sufficient to support any
arbitrary resource graph. If your URL design goes deeper than resource/identifier/resource,
it may be evidence that the granularity of your API is too coarse.

.. recommended::

   Avoid URL designs deeper than resource/identifier/resource.

.. may::

   If your API has URLs deeper than resource/identifier/resource, consider
   revisiting the granularity of your API design.



API Payload formats
-------------------

To interact with an API, a consumer needs to be able to produce and consume messages in
the appropriate format. For a sucessful interaction both parties would need to be able
to process (parse and generate) these messages.

.. should_not::

   Agency APIs should not produce or consume messages in a propietary format. This is
   because open formats maximise interoperability and reduce costs and risks associated
   with API utilisation.

.. may::

   Agency APIs may support multiple (open) payload formats. For example, it is not unusual
   for an API endpoint to support both JSON and XML formats.


API Payload format encoding
---------------------------

To interact with an API, the consumer needs to know how the payload is encoded. This is
true regardless of how many encoding formats the endpoint supports.

.. should_not::

   Agencies should not rely on documentation alone to inform consumers about payload
   encoding. This is generally poor *affordance*.


The three patterns of payload format encoding most frequently found in the wild are:

 * HTTP headers (e.g. `Content-Type:` and `Accept:`) 
 * GET parameters (e.g. `&format=json`)
 * resource label (e.g. `/foo.json`)

Using HTTP headers to specifying payload format can be convenient, however unfortunately
not all clients handle headers consistently. Using HTTP headers alone will create issues
for buggy clients.

Using GET parameters to specify format is another common pattern for specifying the
encoding of API payloads. This results in slightly longer URLs than resource label
technique, and can occasionally create problems with caching behavior of some proxy
servers.

Resource label specification of API payload format, such as `/foo/{id}.json`, are
functionally equivalent to GET parameter encoding but without the (admittedly rare) 
proxy caching issues.

.. should::

   Agency APIs should consider supplimenting URL-based format speficications with
   HTTP header based format specification (e.g.  `Content-Type:` and `Accept:`).

.. should::

   Agency APIs should consider use resource labels to indicate payload format,
   e.g. `/foo/{id}.json`.

.. should::

   If GET parameter based payload format specification is chosen, the potential
   impact of proxy caching and URL length issues should be evaluated.


Good RESTful URL examples
-------------------------

List of magazines:

.. sourcecode:: http
 
   GET /api/v1/magazines.json HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


Filtering and sorting are server-side operations on resources: 

.. sourcecode:: http

   GET /api/v1/magazines.json?year=2011&sort=desc HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


A single magazine in JSON format: 

.. sourcecode:: http

   GET /api/v1/magazines/1234.json HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


All articles in (or belonging to) this magazine: 

.. sourcecode:: http

   GET /api/v1/magazines/1234/articles.json HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


All articles in this magazine in XML format: 

.. sourcecode:: http

   GET /api/v1/magazines/1234/articles.xml HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


Specify query parameters in a comma separated list: 

.. sourcecode:: http

   GET /api/v1/magazines/1234.json?fields=title,subtitle,date HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


Add a new article to a particular magazine: 

.. sourcecode:: http

   POST /api/v1/magazines/1234/articles.json HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


Bad RESTful URL examples
------------------------

Non-plural noun: 

.. sourcecode:: http

   GET /magazine HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


.. sourcecode:: http

   GET /magazine/1234 HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


Verb in URL:

.. sourcecode:: http

   GET /magazine/1234/create HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


Filter outside of query string:

.. sourcecode:: http

   GET /magazines/2011/desc HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript
