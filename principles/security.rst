Privacy and security
====================

**Provide appropriate security and privacy**

The level of protection required for a specific API depends on a risk assessment (e.g. of the consequences of an information leak).

.. should::

   Agencies should match each API to the relevant assurance level so that the controls applied
   can be comapared to the recommendations for that level. 


Table 2: API assurance level implementation guidance

+-----------------+---------------------+----------------------------------+------------------------------------------------------+
| Assurance Level | Identity Confidence | Example information set          | Recommended controls                                 |
+=================+=====================+==================================+======================================================+
| 0               | None                | Open data - for example,         | None                                                 |
|                 |                     | all data sets on data.gov.au     |                                                      |
+-----------------+---------------------+----------------------------------+------------------------------------------------------+
| 1               | Minimal             | Public Data validation services  | Authentication GUID issued to any                    |
|                 |                     | - for example, ABN Lookup        | self-registered entity                               |
|                 |                     |                                  |                                                      |
+-----------------+---------------------+----------------------------------+------------------------------------------------------+
| 2               | Low                 | Parking permit application, tax  | OpenID Connect to accredited identity provider with  |
|                 |                     | return, balance enquiry, private | single factor authentication and level 2 identity    |
|                 |                     | data validation (for example,    | confidence (for example, online registration process |
|                 |                     | TFN validation)                  | with shared secret)                                  |
+-----------------+---------------------+----------------------------------+------------------------------------------------------+
| 3               | Moderate            | Create or update bank details    | OpenID Connect to accredited identity provider with  |
|                 |                     | (for payments & refunds),        | multi-factor authentication and level 3 identity     |
|                 |                     | personal medical records         | confidence – for example, face-to-face registration  |
|                 |                     |                                  | with 100 point Document Verification Service (DVS)   |
|                 |                     |                                  | verified Proof of Identity (POI)                     |
+-----------------+---------------------+----------------------------------+------------------------------------------------------+
| 4               | High                | Not applicable to public API     | Physical identity verification including biometrics  |
|                 |                     | services                         |                                                      |
+-----------------+---------------------+----------------------------------+------------------------------------------------------+


It is very important to apply the right assurance level to each granular API operation.  Failure to do so can seriously impact user experience or service risk.

Guidance on the best practice usage of the OpenID Connect protocol for securing government API services that require NEAF assurance level 2 or 3 is provided in the Securing APIs guide. 

For peer-to-peer messaging using standards such as ebMS3/AS4, the same assurance level is achieved but with different protocols (WS-Security and SAML2.0).  

.. recommended::

   All APIs  should specify their assurance level when applying the relevant controls.

