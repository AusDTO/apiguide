Dogfooding
==========

**Consume your API for your online services**

Agencies that publish APIs must use their own APIs for the providing the equivalent online service. By consuming your own API you will ensure that your API (wholesale) service:

 * remains aligned with your online (retail) service
 * maintains at least the same availability level as your online (retail) service.

For example, an agency has an online web form for a grant application. The web form is completed by a grant applicant and the ‘submit’ action sends the form data to the grant application API.  

Another applicant has chosen to use the services of an intermediary that specialises in grant applications. The intermediary has their own application for grants management and so the application is lodged directly to the agency API, bypassing the online form.

In both these cases, the agency back-end grants assessment system receives the data from the same API interface. If the agency wants to change the online form, they must also change the API – and so both remain aligned.

.. recommended::

   User interfaces (reatail) should consume the corresponding (wholesale) API.
