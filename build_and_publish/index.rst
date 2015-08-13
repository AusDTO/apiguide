Building and using APIs
=======================

Agencies must provide API access to their data and services when any of the following conditions are met:

 * Any transactional or query service with volume above 50,000 per year.
 * Any lower volume service that is an essential complement to a related higher volume service.
 * Any authoritative public data sources containing over 50,000 records.
 * Any new or refreshed digital service.

.. note::

   The above statement is a deliberate provocation, designed to encourage discussion around when APIs should
   and should not be developed. A mandate like that would require appropriate consultation. If you have comments
   or suggestions about this, please raise a ticket (or pull request).


Agencies are encouraged to make all digital services available as an API, even when below the thresholds specified.

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
