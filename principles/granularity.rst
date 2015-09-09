Granularity
===========

**Design granular, re-useable APIs**

A common misconception is that there is a one-to-one mapping between a service in the paper world and a corresponding API. In reality, this is almost never the case. APIs should be designed at the lowest practical level of granularity because this makes each service simpler and allows them to be combined in ways that suit the consumer. The key principle is to design services that can be re-used and combined in different ways.

For example, an agency paper form often combines multiple separate functions on the one document to provide a simpler experience for users of the paper form. Such as, a tax form might collect address data as well as tax information.

In the electronic world, it is better to treat each of the functions as a separate API and have a separate service for each. An address change is logically a separate event that is not related to tax-time reporting. If the address update is part of the tax return then there’s no way to advise government of an address change without also lodging a tax return.

A useful method to determine the right service granularity is to identify the key entities that the service impacts and to model their life cycle/s. There is typically one API operation for each entity life cycle state transition.   

.. recommended::

   There should be only one API function for one business outcome (e.g. change an address).

