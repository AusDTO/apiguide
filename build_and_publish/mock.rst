Mock responses
==============

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

