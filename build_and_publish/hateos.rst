Management state with HATEOAS
=============================

“Hypermedia As The Engine Of Application State” (HATEOAS) is a RESTful technique that can make consumer applications simpler and more robust.  In many applications, the allowed actions on a resource depend on the state of that resource.   Rather than require the consumer to understand and code for the allowed states, HATEOAS provides a means for the server to say what is allowed.  The concept is best explained by example.  

Consider a bank account number 12345 with a positive balance of $100.  A REST query on that resource might return a response indicating that subsequent allowed actions are deposit, withdraw, or transfer:

.. sourcecode:: json

   {
     "account_number”:”12345”’
     “balance”: 100.00,
     “links”:[ 
       {“rel”: "deposit",  “href”:"/account/12345/deposit"}, 
       {“rel”: "withdraw", “href":"/account/12345/withdraw"},
       {“rel”: "transfer", “href”:"/account/12345/transfer"}
     ]
   }


But if the same account is overdrawn by $25 then the only allowed action is deposit:

.. sourcecode:: json

   {
     "account_number”:”12345”’
     “balance”: -25.00,
     “links”:[ 
       {“rel”: "deposit",  “href”:"/account/12345/deposit"}
     ]
   }


It is easy to see how many government interactions also have a similar idea of allowed actions depending on state.

.. should::

   Agencies should adopt HATEOAS designs for their REST implementations where practical.

