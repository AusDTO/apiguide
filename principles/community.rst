Community standards
===================

**Follow consistent information standards**

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


.. recommended::

   Where an established and widely used information standard exists then it should be used.
