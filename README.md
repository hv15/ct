ct - Count
==========

Description
-----------

**ct** is a command line tool to count the number of files and/or
directories in a given directory.

__It uses Ruby, so to use it one needs to have Ruby installed!__

Usage
-----

    Usage: ct [OPTIONS] ... DIR
    
    OPTIONS:
          --files, -f:   Return only file count
           --dirs, -d:   Return only directory count
           --syms, -s:   Return only symbolic link count
      --recursive, -r:   Recursively count
        --verbose, -v:   Show more detail
        --version, -e:   Print version and exit
           --help, -h:   Show this message

NOTE
----

**ct** has only been tested with the following OSs and Ruby
versions:

    Arch Linux x86_64 -- ruby 2.0.0p195 (2013-05-14 revision 40734)


License
-------

This application is licensed under the GPLv3 unless otherwise stated. A copy of
the license can be found in LICENSE.

External Libraries
------------------

I am currently using [Trollop][opt] command-line option parser, which is
included in this repository as __trollop.rb__.

[opt]: http://trollop.rubyforge.org/ "Trollop Parser"
