
Puppet MOTD Module
==================

Introduction
------------

The main use of this module is to be included in other modules to report puppet modules being used in a node.
The code is mostly borrowed from the example of puppet-concat module by ripienaar 
(https://github.com/ripienaar/puppet-concat) and it was mostly used to learn rspecand implement TDD / BDD.

Examples
--------

Usage of this module at its simplest form:

  class myclass {

    # some code of your class here
    # ...
    
    include motd
    motd::register { 'Myclass': }
  }

Would produce a motd similar to the following, when you include the module myclass in your node definition:

  Puppet modules:
  ===============
    - Myclass

You could also use it to put whatever you like in your motd, or ano other file if you change $motd::params::motd:

  node mynode.example.com {
    # some module / class / resource
    # ...
    include motd
    motd::register { 'Disclaimer':
      content => "Some disclaimer that you whish to show"
    }
  }

Notes
-----

 * This modules requires puppet-concat @ https://github.com/ripienaar/puppet-concat

Issues
------

 * None yet

TODO
----

 * If you think of any, let me know

CopyLeft
---------

Copyleft (C) 2012 Emiliano Castagnari <ecastag@gmail.com> (a.k.a. Torian)
