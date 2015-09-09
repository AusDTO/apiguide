Ubiquitous standards
====================

**Use ubiquitous web standards**

Consider API development to be just part of building a website. When choosing technology standards, government should be a follower, not a leader. Just use the same standards and methods that are widely used on the web, following examples set by the leading cloud service platforms. This does not mean use the same technology for everything, but it does mean use the most universally accepted technology solution for each business pattern or requirement.

When choosing technology solutions, the key principles are to:

 * pick the technical solution that minimises implementation effort for API consumers
 * make no assumptions about the software development technologies used by consumer applications.

Any agency that builds an API service interface using a niche technology that is not natively supported by client software development languages will face considerable adoption challenges. Either a number of clients will be commercially or technically excluded, or the agency will need to build, supply, and maintain developer kits for all client technology platforms.  

Follow the links in the table for further guidance on the best practice use of each technology.

Table 1:  API Technology Selection Guide

+------+----------------------------------------+------------------------------------------+--------------------------+-------------------+-----------------------------------------+
| Type | Business Pattern                       | Qualities                                | Preferred Technology     | Data Format       | Potential Examples                      |
+======+========================================+==========================================+==========================+===================+=========================================+
| 1    | Public bulk data file                  | Offline, public                          | Upload to data.gov.au    | CSV, XML, or JSON | Bulk ASIC register, 2015 budget data.   |
+------+----------------------------------------+------------------------------------------+--------------------------+-------------------+-----------------------------------------+
| 2    | Content syndication                    | Online, public                           | ATOM                     | XML               | ABC radio programs                      |
+------+----------------------------------------+------------------------------------------+--------------------------+-------------------+-----------------------------------------+
| 3    | Public data service                    | Synchronous, public                      | REST                     | JSON and XML      | ABR query service                       |
+------+----------------------------------------+------------------------------------------+--------------------------+-------------------+-----------------------------------------+
| 4    | Private query or transactional service | Synchronous , authenticated              | REST with OpenID Connect | JSON and XML      | Grant application & acquittal reporting |
+------+----------------------------------------+------------------------------------------+--------------------------+-------------------+-----------------------------------------+
| 5    | Peer-to-peer message exchange          | Asynchronous, routable, secure, reliable | ebMS3/AS4 with SAML2.0   | XML               | SuperStream Rollover,  UBL e-Invoice    |
+------+----------------------------------------+------------------------------------------+--------------------------+-------------------+-----------------------------------------+


It is expected that the vast majority of government API services will be type 3 or 4.  Therefore we provide further detailed information on REST/JSON APIs in Building and publishing APIs and further detailed information on OpenID Connect in Securing APIs.

.. recommended::

   All new or refreshed API development should conform to the standards in this guide.

