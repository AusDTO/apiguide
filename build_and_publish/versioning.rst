.. versioning:
Use versions
============

Never release an API without a version number.

Versions should be integers, not decimal numbers, prefixed with ‘v’. For example: 

.. Noooooo! use SemVer.org
   Single digit versions are backwards-incompatile design changes
   Double digit versions (major and minor parts) are different feature-sets, different interface specifications, that aim to be forwards compatible within the same Major (but caveat-empour)
   Tripple digit versions are same feature set, same interface spec but different "release" - functionality is not exactly the same, bugs fixed. 

Good: v1, v2, v3

Bad: v-1.1, v1.2, 1.3

Maintain APIs at least one version back.






Record limits

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



Mock responses

It is suggested that each resource accept a 'mock' parameter on the testing server. Passing this parameter should return a mock data response (bypassing the backend).

Implementing this feature early in development ensures that the API will exhibit consistent behavior, supporting a test-driven development methodology.


REST Example 1 – GET /magazines


    Request :  http://example.gov/api/v1/magazines.json


    Response body:
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


REST Example 2 – GET /magazines/[id].json
Example: http://example.gov/api/v1/magazines/1234.json

Response body:
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

REST Example 3 – POST /magazines/[id]/articles
Example: Create – POST http://example.gov/api/v1/magazines/1234/articles

Request body:
    {
        "title": "Raising Revenue",
        "author_first_name": "Jane",
        "author_last_name": "Smith",
        "author_email": "jane.smith@example.gov",
        "date": "2014-06-22",
        "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ante ut augue scelerisque ornare. Aliquam tempus rhoncus quam vel luctus. Sed scelerisque fermentum fringilla. Suspendisse tincidunt nisl a metus feugiat vitae vestibulum enim vulputate. Quisque vehicula dictum elit, vitae cursus libero auctor sed. Vestibulum fermentum elementum nunc. Proin aliquam erat in turpis vehicula sit amet tristique lorem blandit. Nam augue est, bibendum et ultrices non, interdum in est. Quisque gravida orci lobortis... "
    }

Support cross-domain mashups with CORS
It is likely that many of your API consumers will want to mashup your API service with services from other agencies or private sector domains using purely client-side applications (for example, mobile apps or single page apps). Agencies should support this model by delivering Cross-Origin Resource Sharing (CORS) enabled services by default.
There’s a good description of CORS with examples from Mozilla under ‘Overview’
Facilitate state management with HATEOAS where possible
“Hypermedia As The Engine Of Application State” (HATEOAS) is a RESTful technique that can make consumer applications simpler and more robust.  In many applications, the allowed actions on a resource depend on the state of that resource.   Rather than require the consumer to understand and code for the allowed states, HATEOAS provides a means for the server to say what is allowed.  The concept is best explained by example.  
Consider a bank account number 12345 with a positive balance of $100.  A REST query on that resource might return a response indicating that subsequent allowed actions are deposit, withdraw, or transfer:

    {
        "account_number”:”12345”’
      “balance”: 100.00,
      “links”:[ 
            {“rel”: "deposit",  “href”:"/account/12345/deposit"}, 
            {“rel”: "withdraw", “href="/account/12345/withdraw"},
            {“rel”: "transfer", “href”:"/account/12345/transfer"}
      ]}
But if the same account is overdrawn by $25 then the only allowed action is deposit:
    {
        "account_number”:”12345”’
      “balance”: -25.00,
      “links”:[ 
            {“rel”: "deposit",  “href”:"/account/12345/deposit"}
      ]}
It is easy to see how many government interactions also have a similar idea of allowed actions depending on state.  Agencies SHOULD apply HATEOAS constraints to their REST implementations where practical.
Document your API
All APIs must include documentation targeted at the developer that will consume your API.
The best way to ensure that your API documentation is current and accurate is to embed it within your API implementation and then generate the documentation using a framework such as http://apidocjs.com/,  http://swagger.io/, or http://raml.org/index.html. 
 There are a number of sites offering guidance on providing high quality API documentation:
http://www.programmableweb.com/news/web-api-documentation-best-practices/2010/08/12
http://bradfults.com/the-best-api-documentation/
Some good examples of API documentation include:
https://dev.twitter.com/overview/documentation
https://stripe.com/docs/api#charges
https://www.twilio.com/docs/api/rest
Register your API
All APIs must be registered so that they are consistently discoverable. To register your API, send an email to apiregister@dto.gov.au with the following data (sample data provided for data.gov.au API).
API Name  :  data.gov.au query API
API Version : v2
API Protocol : REST
Payload formats: json, xml
API Authentication : none
API Description : An API to query the data.gov.au repository
API Owner Agency : Department of Finance
API Owner contact : data.gov@finance.gov.au 
API Documentation URL : http://data.gov.au/api/v2/documentation 
API Audience (individual, business, agency, third party) : third party
API tags : data, open, ..
 
The content in this guide has been adapted from: https://github.com/WhiteHouse/api-standards 
