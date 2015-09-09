Functionality
=============

**Design APIs to provide full coverage**

.. the entire transaction should be possible using the api

.. HOWEVER, a useful incpmplete thing is better than nothing 

When your API service is being integrated (or ‘mashed up’) into another service then it’s important to ensure you provide APIs that cover the full process life cycle. Failure to do so would seriously impact the user experience, in the consumer service, because users would need to jump between applications to complete a process.

For example, a payroll tax lodgement API that can be consumed by a business payroll system is much less useful if the user must still visit the State Revenue Office portal to register for payroll tax, query obligation calendar, query payment balances, download assessments, and so on.

The same entity life cycle modelling approach that you use to identify service granularity will also help you to understand which services are necessary to support the full business process.

.. recommended::

   Any function that is available via a (retail) UI should also be available as an API (wholesale).
