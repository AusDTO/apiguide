Use RESTful service URLs
^^^^^^^^^^^^^^^^^^^^^^^^

A URL identifies a resource:

 * URLs should include nouns, not verbs.
 * Use plural nouns only for consistency (no singular nouns).
 * Use HTTP methods (HTTP/1.1) to operate on these resources:
 * Use HTTP response status codes to represent the outcome of operations on resources.


Versioning
----------

An API URL should contain a version number, for example:

.. sourcecode:: http

   GET /v1/path/to/resource HTTP/1.1
   Host: www.example.gov.au
   Accept: application/json, text/javascript


See `versioning`_ for more details.

.. note::

   If an API URL does not contain a version number (anonymous version), then it should be understood that it always refers to the latest version. Because the latest version changes with each release, anonymous versions are not stable.

.. was "Don’t accept any requests that do not specify a version number."


Formats
-------

Allow users to request formats like JSON or XML, for example: 

 * http://example.gov/api/v1/magazines.json
 * http://example.gov/api/v1/magazines.xml


.. see #25

You should not need to go deeper than resource/identifier/resource. If you do, then the granularity of your API is probably too coarse.

Parameters in URL v. HTTP header: 

 * If it changes the logic you write to handle the response, put it in the URL.
 * If it does not change the logic for each response, like OAuth info, put it in the header.

Specify query parameters in a comma separated list.

Formats should be in the form of `api/v2/resource/{id}.json`


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
