Endpoint stability
==================

**Provide appropriate stability and availability**

When a third-party software application integrates a government API, then it may become dependent on the continued availability of that API for the software to function correctly. The software package must also depend on the stability of the API so that changes can be planned to fit within a normal software product release cycle. These requirements impose the following service management principles on agency APIs:

 * The availability of the API must be no less than that availability of the equivalent agency online service or website.
 * Where government APIs are essential components of national processes, then they must be designed and operated for continuous availability. Examples are ABN and TFN verification service APIs.
 * Changes to APIs must always be deployed as fully backwards compatible upgrades.  If they are not backwards compatible, the old API version must be maintained alongside the new version for an appropriate period to allow all consumers to transition.
 * Alpha or Beta versions of APIs may have lower availability and stability but the service level should still be clearly specified.

Further information on this topic is provided in the Operate & Improve APIs guidance.


.. recommended::

   All APIs should have a published SLA and behave accordingly.

