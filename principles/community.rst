Design APIs
===========

**Guidance for business analysts and solution architects on designing API services.**

You should first review the Government as a Platform guide to understand the business context and key principles that support API development.  Also please note that this is one of four guidance documents on the subject of implementing API services:

 * Design APIs  (this document)
 * Build & Publish API
 * Secure API
 * Operate & Improve APIs

This design guide is presented as a set of principles and compliance criteria.  We welcome feedback on the content in this design guide.


Design with developer empathy
-----------------------------

Developers are users too and the same principles of user-centred-design apply to the development and publishing of APIs – except that your user is a developer that wants to consume your API rather than an end user that is a customer for the government service or data.  Most of the other criteria in this guide are traceable to this criteria.  

All Government APIs will be published to a central service register as described in Building and publishing APis.  The service register will provide a mechanism for developers to provide feedback on APIs.  An API that is consistently rated as hard to use should be considered defective.

**Conformance Criteria:** less than 20% of feedback rates the API as poor.


Design granular, re-useable APIs
--------------------------------

A common misconception is that there is a one-to-one mapping between a service in the paper world and a corresponding API. In reality, this is almost never the case. APIs should be designed at the lowest practical level of granularity because this makes each service simpler and allows them to be combined in ways that suit the consumer. The key principle is to design services that can be re-used and combined in different ways.

For example, an agency paper form often combines multiple separate functions on the one document to provide a simpler experience for users of the paper form. Such as, a tax form might collect address data as well as tax information.

In the electronic world, it is better to treat each of the functions as a separate API and have a separate service for each. An address change is logically a separate event that is not related to tax-time reporting. If the address update is part of the tax return then there’s no way to advise government of an address change without also lodging a tax return.

A useful method to determine the right service granularity is to identify the key entities that the service impacts and to model their life cycle/s. There is typically one API operation for each entity life cycle state transition.   

**Conformance criteria:** There should be only one API function for one business outcome (eg change an address).


Design APIs to provide full coverage
------------------------------------

When your API service is being integrated (or ‘mashed up’) into another service then it’s important to ensure you provide APIs that cover the full process life cycle. Failure to do so would seriously impact the user experience, in the consumer service, because users would need to jump between applications to complete a process.

For example, a payroll tax lodgement API that can be consumed by a business payroll system is much less useful if the user must still visit the State Revenue Office portal to register for payroll tax, query obligation calendar, query payment balances, download assessments, and so on.

The same entity life cycle modelling approach that you use to identify service granularity will also help you to understand which services are necessary to support the full business process.

**Conformance Criteria:** Any function that is available via a retail UI must also be available as a wholesale API.


Use ubiquitous web standards
----------------------------

Consider API development to be just part of building a website. When choosing technology standards, government should be a follower, not a leader. Just use the same standards and methods that are widely used on the web, following examples set by the leading cloud service platforms. This doesn’t mean use the same technology for everything, but it does mean use the most universally accepted technology solution for each business pattern or requirement.

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

**Conformance criteria:** All new or refreshed API development must conform to the standards in this guide.


Use specialised technologies only in special circumstances
----------------------------------------------------------

There are some cases where a specialised technology is the right choice because it solves a specific problem that would otherwise be very complex and/or there is no other reasonable technical option. In such cases, the agency may choose to apply the specialised technology but **must** only use that technology for the specific problem it’s designed to solve. 

For example, ebMS3 / AS4 is an advanced messaging technology that is built upon XML/SOAP. It is designed for the specific problem of peer-to-peer messaging. Unlike the ‘client-server’ model where an agency provides an API service and many clients can consume the service, the peer-to-peer model has no sense of a service provider or consumer. Instead it is characterised as a community of members that need to exchange electronic documents with each other (such as, B2B e-invoicing).XBRL is a niche technology that is specifically designed for corporate regulatory financial reporting. It is a ‘fact distribution’ model where the provider of data can report any fact so long as it exists in a reference taxonomy (that is, a dictionary of terms). This offers a lot of flexibility for the provider of financial reports that essentially need to provide a machine-readable version of their corporate annual report. But it’s a poor fit for most service APIs that normally need to specify what data must be provided by the consumer.

Although these niche technologies **can** be used outside their design scope, this does not mean that they **should**. The vast majority of government service APIs are a simple client-server model and overloading them with niche or complex technologies will cause unnecessary barriers to uptake.

.. although it is possible to use these niche technologies....

**Conformance criteria:** Any divergence from the standards specified in this guide must include a rationale.


Follow consistent information standards
---------------------------------------

Consistent use of information standards and naming conventions makes your APIs much more usable and interoperable.

In some cases, the complete information structure is externally imposed because you are participating in an information sharing community that has already defined data standards. For example:

 * An agency as an employer must send superannuation member contributions as defined by the SuperStream specification.
 * An agency as a buyer may support electronic invoicing using a standard such as the UN/CEFACT cross industry invoice.

But in most cases the API will be implementing an agency specific service so there won’t be any externally imposed standard that completely describes the service. In these cases, agencies should still make every effort to construct their service using industry standard information components.  For example:

 * iCalendar for events 
 * vCard (or jCard) for name & address
 * KML geospatial data
 * Microformats when embedding structured data in HTML. 

Some useful resources for standard terms and codes that can be used to construct more understandable and interoperable APIs are:

 * Australian Reporting Dictionary www.dictionary.sbr.gov.au 
 * US government National Information Exchange Model www.niem.gov/technical/Pages/current-release.aspx 

**Conformance criteria:** Where an established and widely used information standard exists then it should be used.


Provide useful error messages
-----------------------------

Graceful handling of failure conditions is an essential part of delivering a high quality API. Error messages should:

 * Conform to the standards relevant for the technology in use. 
 * Provide a human-readable error message that is designed to be read and understood by the user.
 * Include a technical diagnostic message that contains technical details for use by the application that is consuming the API.

Further information on error messaging for REST APIs is provided in the Build and publish APIs guidance.

**Conformance criteria:** No unexpected behaviour from any API in production release


Provide appropriate stability and availability
----------------------------------------------

When a third-party software application integrates a government API, then it may become dependent on the continued availability of that API for the software to function correctly. The software package must also depend on the stability of the API so that changes can be planned to fit within a normal software product release cycle. These requirements impose the following service management principles on agency APIs:

 * The availability of the API must be no less than that availability of the equivalent agency online service or website.
 * Where government APIs are essential components of national processes, then they must be designed and operated for continuous availability. Examples are ABN and TFN verification service APIs.
 * Changes to APIs must always be deployed as fully backwards compatible upgrades.  If they are not backwards compatible, the old API version must be maintained alongside the new version for an appropriate period to allow all consumers to transition.
 * Alpha or Beta versions of APIs may have lower availability and stability but the service level should still be clearly specified.

Further information on this topic is provided in the Operate & Improve APIs guidance.

**Conformance criteria:**  All APIs must have a published SLA and should behave accordingly.


Provide appropriate security and privacy
----------------------------------------

The level of protection required for a specific API depends on a risk assessment of the consequences of an information leak.  Agencies must match each API to the relevant assurance level and then apply the controls recommended for that level. 

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
| 2               | Low                 | Parking permit application, tax  | OpenID Connect to acc redited identity provider with |
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

**Conformance criteria:** All APIs must specify their assurance level and must apply the relevant controls.


Ensure APIs are discoverable and documented
-------------------------------------------

For APIs to be used, they must be discoverable and documented.  The single most important quality of APIs requested by developers is that they are well documented. Agencies must:

 * List their APIs on the DTO service registry. Detailed information on how to do this is provided on the Building and using APIs guidance.
 * Document all their APIs and provide a link to the documentation in the DTO service registry.  
 * Provide feedback and support channels for API users.

The best practice for documentation of APIs is to generate the documentation from the API itself so that there is always a precise alignment between the API and it’s documentation.  Open source tools such as http://swagger.io/ provide simple means to document APIs.

**Conformance criteria:** All APIs are published, documented, and supported.


Consume your API for your online services
-----------------------------------------

Agencies that publish APIs must use their own APIs for the providing the equivalent online service. By consuming your own API you will ensure that your API (wholesale) service:

 * remains aligned with your online (retail) service
 * maintains at least the same availability level as your online (retail) service.

For example, an agency has an online web form for a grant application. The web form is completed by a grant applicant and the ‘submit’ action sends the form data to the grant application API.  

Another applicant has chosen to use the services of an intermediary that specialises in grant applications. The intermediary has their own application for grants management and so the application is lodged directly to the agency API, bypassing the online form.

In both these cases, the agency back-end grants assessment system receives the data from the same API interface. If the agency wants to change the online form, they must also change the API – and so both remain aligned.

**Conformance criteria:** All retail user interfaces must consume the corresponding wholesale API.
