Special circumstances
=====================

**Use specialised technologies only in special circumstances**

There are some cases where a specialised technology is the right choice because it solves a specific problem that would otherwise be very complex and/or there is no other reasonable technical option.

.. may::

   When a case can be made that specialised technology is the best fit for solving
   a speficic technical problem, an agency may chose to use that technology over
   adopting a more ubiquitous standard.

.. should::

   When an agency chooses to apply a specialised technology, they should only use
   that technology for the specific problem it’s designed to solve.


For example, ebMS3 / AS4 is an advanced messaging technology that is built upon XML/SOAP. It is designed for the specific problem of peer-to-peer messaging. Unlike the ‘client-server’ model where an agency provides an API service and many clients can consume the service, the peer-to-peer model has no sense of a service provider or consumer. Instead it is characterised as a community of members that need to exchange electronic documents with each other (such as, B2B e-invoicing).XBRL is a niche technology that is specifically designed for corporate regulatory financial reporting. It is a ‘fact distribution’ model where the provider of data can report any fact so long as it exists in a reference taxonomy (that is, a dictionary of terms). This offers a lot of flexibility for the provider of financial reports that essentially need to provide a machine-readable version of their corporate annual report. But it’s a poor fit for most service APIs that normally need to specify what data must be provided by the consumer.

Although these niche technologies **can** be used outside their design scope, this does not mean that they **should**. The vast majority of government service APIs are a simple client-server model and overloading them with niche or complex technologies will cause unnecessary barriers to uptake.

.. although it is possible to use these niche technologies....

.. should::

   Agencies should be prepared to provide a rationale for diverging from the standards specified in this guide.

