.. versioning:

Use versions
============

Never release an API without a version number.

Versions should be integers, not decimal numbers, prefixed with ‘v’. For example: 

.. Noooooo! use SemVer.org
   Single digit versions are backwards-incompatile design changes
   Double digit versions (major and minor parts) are different feature-sets, different interface specifications, that aim to be forwards compatible within the same Major (but caveat-empour)
   Tripple digit versions are same feature set, same interface spec but different "release" - functionality is not exactly the same, bugs fixed. 

Good: v1, v2, v3

Bad: v-1.1, v1.2, 1.3

Maintain APIs at least one version back.

