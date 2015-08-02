Preface to the API Design Guide
===============================

Like websites and hand-held device apps, APIs (Application Programming Interfaces) are just another digital channel for delivering services online. APIs already power many of today's websites and apps, and in the future they are likely to become more important. This is not just because they are the cheapest, fastest, most cost effective way to deliver some kinds of digital services. It's because they can be incorporated into downstream applications that recombine them in creative ways. Good APIs are a case of less being more, stripping a digital service down to it's simplest possible form, so that the value of the service can be amplified through reuse.

The principle of user-centred design is at the core of website and application development. It's about ergonomics; can a user "consume a digital service" without bad design getting in their way? Getting this right requires empathy for users, validated by real user experiences. It's at least a well known principle, if not always well practised.

In some ways, developer empathy is exactly the same; developers are people too. But when developers create value by exploiting an API, they can deliver it to many people. A successful user interaction is a single service delivery event, a single good user experience. A successful API integration is a long lever that can result in many good user experiences.

.. epigraph::

   We have developer empathy. If our interfaces are hard to use, we consider that a bug.
   We are an engineer-led company. Everything we do tries to be compatible with our API.

   -- Steve Mayzac, ElasticSearch (around 6.20 into https://www.youtube.com/watch?v=uxfvNwl_MGc).


User empathy is focused on ergonomics at the point of delivery. Developer empathy is focused on the software integration experience. It's still fundamentally about ergonomics but the context is different. As a user, successful design has the quality of affordance (obviousness, "don't make me think"). As a developer, successful design also means knowing how to use an API (affordance through idioms, adequate documentation) and functional fit for a previously unimagined application, but also knowing how and when things are going to change and other stuff that matters in a business partnership with someone else's IT system.

The gold standard in developer empathy is found in thriving open source projects. Collaboration, peer review and a responsive, supportive community. Organisations that do well in this space nurture their relationship with developers as though their survival depends on it. This does not describe Australian Government IT of today, but it just might describe the "government as a platform" of the future. Some things are certain; APIs are important, their importance is growing, developer empathy is important and we need all the help we can get.

The DTO was about to release a draft API design guide which describes developer empathy as a key principle behind contemporary best practices. When launched, this document will be mandatory policy that all Commonwealth agencies will be obliged to follow, and citizens will be entitled to expect. The purpose of releasing a draft is to get feedback, but at the last minute we had a better idea...

We want feedback from developers, right? What if we converted it to a developer-friendly format, published in a version control system, opened a public ticket system for issues and support, and invited pragmatic people everywhere to help us make it better? Done:

 * read https://apiguide.readthedocs.org/
 * discus https://github.com/AusDTO/apiguide/issues
 * kanban https://waffle.io/AusDTO/apiguide
 * fork https://github.com/AusDTO/apiguide.git

Pull requests welcome!
