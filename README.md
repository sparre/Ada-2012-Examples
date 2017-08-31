[Build and Test Setup][1]
=========================

This is my build and test "framework".  It represents a generalised version of
my (currently) preferred arrangement of the building and testing of an Ada
project.

"Makefile", "ada_2012.gpr" and "tests/" are intended to be reused as-is.

"Makefile.project" is intended for fixed, project specific parameters.

"Makefile.project_rules" is intended for project specific build rules.

Configuration parameters should be written (as "make" variables) to ".config",
which will be included by "Makefile".

".hgignore" is intended as a starting point for a project specific ignore file.

"the_project.gpr" is intended as a starting point for a GNAT project file for
the project.

Ada source files should be kept under "src/".


Included tests
--------------

The repository comes with a ready-to-use test case:

1) 'unused_units' - warns about units which aren't compiled.


Build dependencies
------------------

+ Bash
+ GNU Make
+ GNU Parallel (or `xargs`)
+ GNAT
+ Mercurial (`hg`)
+ Perl


Testing
-------

    OS_VERSION=unix make test

Builds and tests the demonstration executable.


Building
--------

    OS_VERSION=unix make build

Builds the demonstration executable.


Copyright
---------

The copyright to the software belongs to JSA Research & Innovation.  The
software is distributed under the Beer Ware License (revision 42):

>  <jacob@jacob-sparre.dk> wrote this. As long as you retain this notice
>  you can do whatever you want with this stuff. If we meet some day, and
>  you think this stuff is worth it, you can buy me a beer in return.


Links
-----

If you want to find free Ada tools or libraries, [AdaIC][2] is an excellent
starting point.  You can also take a look at
[my other source text repositories][3] or [my web site][4].

[1]: http://repositories.jacob-sparre.dk/reference-build-and-test-setup "Source text repository"
[2]: http://www.adaic.org/ada-resources/tools-libraries/ "Free Ada Tools and Libraries"
[3]: http://repositories.jacob-sparre.dk/ "My repositories on Bitbucket"
[4]: http://www.jacob-sparre.dk/ "My web site"

