Building and using APIs
=======================

**Technical guidance for developers implementing web APIs**

You should first review the Government as a Platform guide to understand the business context and key principles that support API development.

For Application programming interfaces (APIs) that serve private or commercial-in-confidence data, all the principles described here still apply but the API should also be protected via OpenID Connect authentication & authorisation as described in Securing APIs guidance.


Why must I?
-----------
Agencies must provide API access to their data and services when any of the following conditions are met:

 * Any transactional or query service with volume above 50,000 per year.
 * Any lower volume service that is an essential complement to a related higher volume service.
 * Any authoritative public data sources containing over 50,000 records.
 * Any new or refreshed digital service.

Agencies are encouraged to make all digital services available as an API, even when below the thresholds specified.


How do I?
---------

It is recommended that agencies deliver all APIs following ‘Pragmatic REST’ (Representational state transfer) principles detailed below.


.. toctree::

   use_RESTful_urls
   use_HTTP_methods
   versioning
   batching_results
   mock
   cors
   hateos
   documentation
   advertise

The content in this guide has been adapted from: https://github.com/WhiteHouse/api-standards 
